// Graphing sketch

// This program takes ASCII-encoded strings from the serial port at 9600 baud
// and graphs them. It expects values in the range 0 to 1023, followed by a
// newline, or newline and carriage return

// created 20 Apr 2005
// updated 24 Nov 2015
// by Tom Igoe
// This example code is in the public domain.

import processing.serial.*;

Serial myPort;        // The serial port

// -------------------
int brightness = 0;
int distance = 0;
PImage lightImage = new PImage();
PImage heartImage = new PImage();
int heart = 0;

void setup () {
  size(1600, 1200);
  myPort = new Serial(this, Serial.list()[0], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  heartImage = loadImage("heart.png");
  background(50);
}

void setLightImage() {
  if (brightness < 100) {
    lightImage = loadImage("0.png");
  } else if (100 <= brightness && brightness < 200) {
    lightImage = loadImage("1.png");
  }  else if (200 <= brightness && brightness < 300) {
    lightImage = loadImage("2.png");
  }  else if (300 <= brightness && brightness < 400) {
    lightImage = loadImage("3.png");
  }  else if (400 <= brightness && brightness < 500) {
    lightImage = loadImage("4.png");
  } else if (500 <= brightness && brightness < 600) {
    lightImage = loadImage("5.png");
  }  else if (600 <= brightness && brightness < 700) {
    lightImage = loadImage("6.png");
  }  else if (700 <= brightness && brightness < 800) {
    lightImage = loadImage("7.png");
  } else {
    lightImage = loadImage("8.png");
   }
}

void draw () {  
  background(50);
  image(lightImage, 600, 50);
  fill(0);
  rect(100, 650, 50, -600);
  fill(200, 200, 0);
  rect(100, 650, 50, - int(distance) * 600 / 900);
  image(heartImage, 900, 50, heart * 0.9, heart * 0.9);
  
  // draw the line:
  /*
  
  stroke(127, 34, 255);
  line(xPos, height, xPos, height - inByte);

  // at the edge of the screen, go back to the beginning:
  if (xPos >= width) {
    xPos = 0;
    background(int(brightness));
  } else {
    // increment the horizontal position:
    xPos++;
  }
  */
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
  
  if (inString != null) {
    // creates an array with all analog inputs
    inString = inString.substring(0, inString.length() - 1);
    String[] input = split(inString, '/');
    
    //-------------debug-----------------
    print("Inputs: [" + input[0]);
    for(int i = 1; i < input.length; i++) {
      print("," + input[i]);
    }
    print("]\n");
    print("Voltages: [" + str(int(input[0]) * 5/1024));
    for(int i = 1; i < input.length; i++) {
      print("," + str(int(input[i]) * 5/1024));
    }
    print("]\n");
    //-------------------------------------
    
    distance = int(input[0]);
    brightness = int(input[1]);
    setLightImage();
    heart = int(input[2]);
    
  }
}
