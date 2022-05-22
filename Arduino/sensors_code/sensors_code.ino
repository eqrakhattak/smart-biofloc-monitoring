#include <OneWire.h>
#include <DallasTemperature.h>

// GPIO where the DS18B20 is connected to temp sensor
const int oneWireBus = 5;     
// Setup a oneWire instance to communicate with any OneWire devices
OneWire oneWire(oneWireBus);
// Pass our oneWire reference to Dallas Temperature sensor 
DallasTemperature sensors(&oneWire);


// pin connected to ph sensor
const int potPin=A0;
float ph;
float Value=0;


void setup() {
  //blink
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
  
  //temp sensor code:
  // Start the Serial Monitor
  Serial.begin(115200);
  // Start the DS18B20 sensor
  sensors.begin();

  // put your ph sensor setup code:
  pinMode(potPin,INPUT);
  delay(1000);
}

void loop() {
  //blinks over n over
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);   
  
  //temp code:
  sensors.requestTemperatures(); 
  float temperatureC = sensors.getTempCByIndex(0);
  float temperatureF = sensors.getTempFByIndex(0);
  Serial.print(temperatureC);
  Serial.println("ºC");
  Serial.print(temperatureF);
  Serial.println("ºF");

  //ph code:
  Value= analogRead(potPin);
  Serial.print(Value);
  Serial.print(" | ");
  float voltage=Value*(3.3/4095.0);
  ph=(3.3*voltage);
  Serial.println(ph);
  
  delay(5000);
}
































//
//
//#include <OneWire.h>
//#include <DallasTemperature.h>
//
//// TEMPRATURE INITIALIZATIONS
//// Data wire is connected to digital pin 5 on the ESP8266
//#define ONE_WIRE_BUS 5
//// Setup a oneWire instance to communicate with any OneWire device
//OneWire oneWire(ONE_WIRE_BUS);  
//// Pass oneWire reference to DallasTemperature library
//DallasTemperature sensors(&oneWire);
//
////PH INITIALIZATIONS
//const int potPin=A0;
//float ph;
//float Value=0;
//
////CODE
//void setup(void)
//{
//  sensors.begin();  // Start up the library
//  Serial.begin(115200);
//
//  // put your ph setup code here, to run once:
////  Serial.begin(115200);
//  pinMode(potPin,INPUT);
//  delay(1000);
//}
// 
//void loop(void)
//{ 
//  // Send the command to get temperatures
//  sensors.requestTemperatures(); 
// 
//  //print the temperature in Celsius
//  Serial.print("Temperature: ");
//  Serial.print(sensors.getTempCByIndex(0));
//  Serial.print((char)176);//shows degrees character
//  Serial.print("C  |  ");
//  
//  //print the temperature in Fahrenheit
//  Serial.print((sensors.getTempCByIndex(0) * 9.0) / 5.0 + 32.0);
//  Serial.print((char)176);//shows degrees character
//  Serial.println("F");
//  
////  delay(500);
//  //print ph
//  Value= analogRead(potPin);
//  Serial.print(Value);
//  Serial.print(" | ");
//  float voltage=Value*(3.3/4095.0);
//  ph=(3.3*voltage);
//  Serial.println(ph);
//  
//  delay(500);
//}
