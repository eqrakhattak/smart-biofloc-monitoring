#if defined(ESP32)
#include <WiFi.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#endif
#include <NTPClient.h>
#include <WiFiUdp.h>
#include <Firebase_ESP_Client.h>
#include <OneWire.h>
#include <DallasTemperature.h>

/* 1. Define the WiFi credentials */
#define WIFI_SSID "fivebruh"
#define WIFI_PASSWORD "123456789"

/* 2. Define the API Key */
#define API_KEY "AIzaSyDm-OvE0fLLSBQuIAma8W9dVbkufL_ovlw"

/* 3. Define the project ID */
#define FIREBASE_PROJECT_ID "scifish-570ad"

/* 4. Define the user Email and password that alreadey registerd or added in your project */
#define USER_EMAIL "eqra@email.com"
#define USER_PASSWORD "123456"

// Define Firebase Data object
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

unsigned long dataMillis = 0;

const long utcOffsetInSeconds = 18000;
// Define NTP Client to get time
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org", utcOffsetInSeconds);

// GPIO Data wire is connected to D2 & 3V & G on the esp8266 for temprature sensor
#define ONE_WIRE_BUS 4
int Sensor = 5; //d1 //RCWL-0516 Input Pin
int led = 2; //LED Pin
// Setup a oneWire instance to communicate with any OneWire device
OneWire oneWire(ONE_WIRE_BUS);
// Pass oneWire reference to DallasTemperature library
DallasTemperature sensors(&oneWire);

// A0 pin connected to ph sensor & 3V & G
const int potPin=A0;
float ph;
float value=0;


void setup()
{

    Serial.begin(115200);

    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    Serial.print("Connecting to Wi-Fi");
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.print(".");
        delay(300);
    }
    Serial.println();
    Serial.print("Connected with IP: ");
    Serial.println(WiFi.localIP());
    Serial.println();

    timeClient.begin();
    
    Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

    /* Assign the api key (required) */
    config.api_key = API_KEY;

    /* Assign the user sign in credentials */
    auth.user.email = USER_EMAIL;
    auth.user.password = USER_PASSWORD;

#if defined(ESP8266)
    // In ESP8266 required for BearSSL rx/tx buffer for large data handle, increase Rx size as needed.
    fbdo.setBSSLBufferSize(2048 /* Rx buffer size in bytes from 512 - 16384 */, 2048 /* Tx buffer size in bytes from 512 - 16384 */);
#endif
    
    // Limit the size of response payload to be collected in FirebaseData
    fbdo.setResponseSize(2048);
    Firebase.begin(&config, &auth);
    Firebase.reconnectWiFi(true);

    //blink builtin led
    // initialize digital pin LED_BUILTIN as an output.
    pinMode(LED_BUILTIN, OUTPUT);
    
    // Start up the DS18B20 temperature sensor
    sensors.begin();
  
    // water level sensor connected to D1 & 3V
    pinMode(Sensor,INPUT);
    //led connected to D4 & G
    pinMode(led, OUTPUT);
  
    // put your ph sensor setup code:
    pinMode(potPin,INPUT);
  
    //delay in readings 1sec
//    delay(5000);
    
}

long generateRandom() {

    long inSeconds = millis() / 10000;
    long negative = 999999999 - inSeconds;
    return negative;
}

//long convertToMillis(){
//  long millisecs = timeClient.getHours() * timeClient.getMinutes() * timeClient.getSeconds() * 1000;
//  return millisecs;
//}

void loop()
{
  
//    timeClient.update();
  
    // Firebase.ready() should be called repeatedly to handle authentication tasks.
    if (Firebase.ready() && (millis() - dataMillis > 50000 || dataMillis == 0))
    {
        dataMillis = millis();

        //Esp8266 builtin led blinks over n over
        digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
        delay(1000);                       // wait for a second
        digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
        delay(1000); 
       
        //print the temperature in Celsius and Fehrenheit
        sensors.requestTemperatures(); 
        float temperatureC = sensors.getTempCByIndex(0);
        float temperatureF = sensors.getTempFByIndex(0);
        Serial.print(temperatureC);
        Serial.println("ºC");
        Serial.print(temperatureF);
        Serial.println("ºF");

        //Create document and add temp data to firestore
        FirebaseJson tempContent;
        String tempDocumentPath = "temp/" + String(generateRandom());
        tempContent.set("fields/celcius/stringValue", String(temperatureC, 2));
        tempContent.set("fields/fahrenheit/stringValue", String(temperatureF, 2));
        Serial.print("Create a temperature document... ");
        if (Firebase.Firestore.createDocument(&fbdo, FIREBASE_PROJECT_ID, "" /* databaseId can be (default) or empty */, tempDocumentPath.c_str(), tempContent.raw()))
            Serial.printf("ok\n%s\n\n", fbdo.payload().c_str());
        else
            Serial.println(fbdo.errorReason());


        //print pH
        value= analogRead(potPin);
        Serial.print(value);
        Serial.print(" | ");
        float voltage=value*(3.3/4095.0);
        ph=(3.3*voltage);
        Serial.println(ph);

        //Create document and add ph data to firestore
        FirebaseJson phContent;
        String phDocumentPath = "pH/" + String(generateRandom());
        phContent.set("fields/potpin/stringValue", String(value, 2));
        phContent.set("fields/phvalue/stringValue", String(ph, 3));
        Serial.print("Create a ph document... ");
        if (Firebase.Firestore.createDocument(&fbdo, FIREBASE_PROJECT_ID, "" /* databaseId can be (default) or empty */, phDocumentPath.c_str(), phContent.raw()))
            Serial.printf("ok\n%s\n\n", fbdo.payload().c_str());
        else
            Serial.println(fbdo.errorReason());

      
        //water level code
        String waterLevel = "";
         if (digitalRead(Sensor) == HIGH )
            {
              digitalWrite(led,HIGH);
              Serial.flush();
              waterLevel = "HIGH";
              Serial.println(waterLevel); 
            }
            else {
              digitalWrite(led, LOW);
              waterLevel = "LOW";
              Serial.println(waterLevel); 
            } 

        //Create document and add water data to firestore
        FirebaseJson waterContent;
        String waterDocumentPath = "water/" + String(generateRandom());
        waterContent.set("fields/level/stringValue", "59.2");
        waterContent.set("fields/status/stringValue", waterLevel);
        waterContent.set("fields/volume/stringValue", "880.0");
        Serial.print("Create a water document... ");
        if (Firebase.Firestore.createDocument(&fbdo, FIREBASE_PROJECT_ID, "" /* databaseId can be (default) or empty */, waterDocumentPath.c_str(), waterContent.raw()))
            Serial.printf("ok\n%s\n\n", fbdo.payload().c_str());
        else
            Serial.println(fbdo.errorReason());
        
    }

    delay(5000);
}
