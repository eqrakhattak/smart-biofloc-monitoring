#include <OneWire.h>
#include <DallasTemperature.h>
 
// GPIO Data wire is connected to D2 & 3V & G on the esp8266
#define ONE_WIRE_BUS 4
int Sensor = 5;  //RCWL-0516 Input Pin
int led = 2; //LED Pin
// Setup a oneWire instance to communicate with any OneWire device
OneWire oneWire(ONE_WIRE_BUS);
// Pass oneWire reference to DallasTemperature library
DallasTemperature sensors(&oneWire);

// A0 pin connected to ph sensor & 3V & G
const int potPin=A0;
float ph;
float Value=0;

void setup(void)
{
  //blink builtin led
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
  
  // Start up the DS18B20 temperature sensor
  sensors.begin();
  //Start serial monitor
  Serial.begin(115200);

  // water level sensor connected to D1 & 3V
  pinMode(Sensor,INPUT);
  //led connected to D4 & G
  pinMode(led, OUTPUT);

  // put your ph sensor setup code:
  pinMode(potPin,INPUT);

  //delay in readings 1sec
  delay(1000);
}
 
void loop(void)
{ 
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

  //print pH
  Value= analogRead(potPin);
  Serial.print(Value);
  Serial.print(" | ");
  float voltage=Value*(3.3/4095.0);
  ph=(3.3*voltage);
  Serial.println(ph);

  //water level code
   if (digitalRead(Sensor) == HIGH )
      {
        digitalWrite(led,HIGH);
        Serial.flush();
        Serial.println( "level full" ); 
      }
      else {
        digitalWrite(led, LOW);
        Serial.println( "level remaining" ); 
      } 
      
   delay(1000);

}
