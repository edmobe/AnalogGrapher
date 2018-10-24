/*
  Graph

  A simple example of communication from the Arduino board to the computer: The
  value of analog input 0 is sent out the serial port. We call this "serial"
  communication because the connection appears to both the Arduino and the
  computer as a serial port, even though it may actually use a USB cable. Bytes
  are sent one after another (serially) from the Arduino to the computer.

  You can use the Arduino Serial Monitor to view the sent data, or it can be
  read by Processing, PD, Max/MSP, or any other program capable of reading data
  from a serial port. The Processing code below graphs the data received so you
  can see the value of the analog input changing over time.

  The circuit:
  - any analog input sensor attached to analog in pin 0

  created 2006
  by David A. Mellis
  modified 9 Apr 2012
  by Tom Igoe and Scott Fitzgerald

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/Graph
*/

int currentPulseVoltage;
int lastPulseVoltage;
int counter;
float currentTime;
float lastTime;

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);
}

void loop() {
  
  Serial.print(analogRead(A0));
  Serial.print("/");
  Serial.print(analogRead(A1));
  Serial.print("/");
  Serial.print(analogRead(A2));
  Serial.print("/");
  Serial.print(analogRead(A3));
  Serial.print("/");
  Serial.print(analogRead(A4));
  Serial.print("/");
  Serial.print(analogRead(A5));
  Serial.print("\n");
  
  //Serial.println(analogRead(A2));
  /*
  currentPulseVoltage = analogRead(A2);
  if (currentPulseVoltage > 430 && lastPulseVoltage <= 430) {
      counter++;
  }
  if (counter >= 3) {
    currentTime = millis();
    Serial.println(currentTime - lastTime);
    counter = 0;
    lastTime = currentTime;
  }
  lastPulseVoltage = currentPulseVoltage;
  */
  //Serial.println(currentPulseVoltage);
  
  
  //delay(10);
}
