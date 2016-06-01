import ddf.minim.*;
AudioPlayer tema;
Minim minim;
float x = 0;
int y = 0;
//float b = 0;
String texto;
PFont titulo;
int y1;
int axisX = 0;
int axisY1 = 0; 
int axisY2 = 6; 
int axisY3 = 11;


void setup() {
  size(1280, 600, P2D);
  background(255);
  minim = new Minim(this);
  tema = minim.loadFile("1.mp3", 256);
  tema.play();
  //tema.loop();
  //titulo = loadFont("ArialMT-48.vlw");
  //textFont(titulo, 16);
  //textAlign(LEFT);
}

void draw() {

  int count = 0;
  int lowTot = 0;
  int midTot = 0;
  int highTot = 0;
  for (int i = 0; i < tema.left.size()/3.0; i+=5) {
    lowTot+= (abs(tema.left.get(i))*30 );
    midTot+= (abs(tema.left.get(i))*20 );
    highTot+= (abs(tema.left.get(i))*10 );
    count++;
  }
  fill(map(highTot, 0, count*10, 0, 255), 0, 0);
  axisX = axisX+5;
  if (axisX>1280) {
    axisX = 0;
    axisY1 = axisY1+15;
    axisY2 = axisY2+15;
    axisY3 = axisY3+15;
  }
  rect(axisX, axisY1, 5, 5);
  //point(axisX, axisY1);
  //rect(x, y, width, height);
  x = x + width;
  if (x >3*width) {
    x = 0;
  }
  fill(0, map(midTot, 0, count*10, 0, 255), 0);

  rect(axisX, axisY2, 5, 5);
  //point(axisX, axisY2);
  //rect(x, y, width, height);
  x += width;
  if (x >3*width) {
    x = 0;
  }
  fill(0, 0, map(lowTot, 0, count*10, 0, 255));

  //point(axisX, axisY3);
  rect(axisX, axisY3, 5, 5);
  //rect(x, y, width, height);
  x += width;
  if (x >3*width) {
    x = 0;
  }
  //this part of animation doesn't work and i don't understand why? I want that text moves away
  y1 = height-5;
  y1++;
}

void stop() {
  tema.close();
  minim.stop(); 
  super.stop();
}