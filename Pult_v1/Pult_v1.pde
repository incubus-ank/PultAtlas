import processing.video.*;
import processing.serial.*;

int value = 0;
int out = 0;
Capture cam;
Serial myPort;

void setup() {
  size(640, 480);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    printArray(Serial.list());
    myPort = new Serial(this, Serial.list()[0], 19200);
    
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[1]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();ws
  }
  image(cam, 0, 0);
  if ( key == 'w'){
      out = 50;
  }
  if ( key == 's'){
    out = 0;
  }
  

  
  textSize(32);
  text(out, 10, 30); 
  fill(0, 102, 153);
  
  while (myPort.available() > 0) {
    String inBuffer = myPort.readString();   
    if (inBuffer != null) {
      println(inBuffer);
    }
  }
  
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
  myPort.write(out);
}

void keyPressed() {

}
