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
