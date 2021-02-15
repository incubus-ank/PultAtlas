import processing.video.*;
import processing.serial.*;

int value = 0;
int out = 0;
//Capture cam;
Serial myPort;

void setup() {
  size(640, 480);
   
  //String[] cameras = Capture.list(); //<>//
  
  //if (cameras.length == 0) {
  //  println("There are no cameras available for capture.");
  //  exit();
  //} else {
  //  println("Available cameras:");
  //  for (int i = 0; i < cameras.length; i++) {
  //    println(cameras[i]);
  //  }
    
    printArray(Serial.list());
    myPort = new Serial(this, Serial.list()[0], 19200);
    
    //cam = new Capture(this, "Integrated Camera"); //<>//
    //cam.start();
  }      

void draw() {
 // if (cam.available() == true) {
 //   cam.read();
 // }
 
  textSize(32);
  text(out, 10, 30); 
  fill(0, 102, 153);
  
  while (myPort.available() > 0) {
    String inBuffer = myPort.readString();   
    if (inBuffer != null) {
      println(inBuffer);
    }
  }
  
  if (keyPressed == true){
   switch (key) {
    case 'w':  out = 49;
             break;
    case 's':  out = 24;
             break;
    case 'a':  out = 99;
             break;
    case 'd':  out = 74;
             break;
    case 'c':  out = 150;
             break;
    case 'f':  out = 400;
             break;
    case 'v':  out = 155;
             break;
    case 'x':  out = 151;
             break;
   }
  }else{
    out = 0;
  }
  
  //println(out);

  myPort.write(out);
  delay(30);
}

void keyPressed(){
}
