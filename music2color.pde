import ddf.minim.*;
AudioPlayer dumb, walls, view;
Minim minim;
float x = 0;
int y = 0;
int axisX = 0;
int axisY1 = 0; 
int axisY2 = 6; 
int axisY3 = 11;
int screen, last;
PImage open;

void setup() {
  size(1280, 600, P2D);
  background(255);
  open = loadImage("open.png");
  minim = new Minim(this);
  walls = minim.loadFile("01.mp3", 256);
  dumb = minim.loadFile("02.mp3", 256);
  view = minim.loadFile("03.mp3", 256);
}

void draw() {
  println(mouseX, mouseY);
  switch(screen) {

  case 0:
    image(open, 0, 0);
    axisX = 0;
    axisY1 = 1; 
    axisY2 = 6; 
    axisY3 = 11;
    break;

    //case 1:
    //background(255);
    //int last = 0;
    //  if (millis() > last+2000) {
    //    last = millis();
    //    screen = 2;
    //  }
    //break;

  case 2:
    int count = 0;
    int lowTot = 0;
    int midTot = 0;
    int highTot = 0;
    for (int i = 0; i < walls.left.size()/3.0; i+=5) {
      lowTot+= (abs(walls.left.get(i))*30 );
      midTot+= (abs(walls.left.get(i))*20 );
      highTot+= (abs(walls.left.get(i))*10 );
      count++;
    }
    axisX = axisX+5;
    if (axisX>1280) {
      axisX = 0;
      axisY1 = axisY1+15;
      axisY2 = axisY2+15;
      axisY3 = axisY3+15;
      if (axisY1 > 600) {
        walls.close();
        textSize(15);
        fill(255);
        text("F(x)_4 Walls", 0, 15);
        reset();
        screen = 0;
      }
    }
    fill(map(highTot, 0, count*10, 0, 255), 0, 0);
    rect(axisX, axisY1, 5, 5);
    fill(0, map(midTot, 0, count*10, 0, 255), 0);
    rect(axisX, axisY2, 5, 5);
    fill(0, 0, map(lowTot, 0, count*10, 0, 255));
    rect(axisX, axisY3, 5, 5);
    break;


  case 3:
    int count2 = 0;
    int lowTot2 = 0;
    int midTot2 = 0;
    int highTot2 = 0;
    for (int i = 0; i < dumb.left.size()/3.0; i+=5) {
      lowTot2+= (abs(dumb.left.get(i))*30 );
      midTot2+= (abs(dumb.left.get(i))*20 );
      highTot2+= (abs(dumb.left.get(i))*10 );
      count2++;
    }
    axisX = axisX+5;
    if (axisX>1280) {
      axisX = 0;
      axisY1 = axisY1+15;
      axisY2 = axisY2+15;
      axisY3 = axisY3+15;
      if (axisY1 > 600) {
        dumb.close();
        textSize(15);
        fill(255);
        text("Red Velvet_Dumb Dumb", 0, 15);
        reset();
        screen = 0;
      }
    }
    fill(map(highTot2, 0, count2*10, 0, 255), 0, 0);
    rect(axisX, axisY1, 5, 5);
    fill(0, map(midTot2, 0, count2*10, 0, 255), 0);
    rect(axisX, axisY2, 5, 5);
    fill(0, 0, map(lowTot2, 0, count2*10, 0, 255));
    rect(axisX, axisY3, 5, 5);
    break;


  case 4:
    int count3 = 0;
    int lowTot3 = 0;
    int midTot3 = 0;
    int highTot3 = 0;
    for (int i = 0; i < view.left.size()/3.0; i+=5) {
      lowTot3+= (abs(view.left.get(i))*30 );
      midTot3+= (abs(view.left.get(i))*20 );
      highTot3+= (abs(view.left.get(i))*10 );
      count3++;
    }
    axisX = axisX+5;
    if (axisX>1280) {
      axisX = 0;
      axisY1 = axisY1+15;
      axisY2 = axisY2+15;
      axisY3 = axisY3+15;
      if (axisY1 > 600) {
        view.close();
        textSize(15);
        fill(255);
        text("Shinee_View", 0, 15);
        reset();
        screen = 0;
      }
    }
    fill(map(highTot3, 0, count3*10, 0, 255), 0, 0);
    rect(axisX, axisY1, 5, 5);
    fill(0, map(midTot3, 0, count3*10, 0, 255), 0);
    rect(axisX, axisY2, 5, 5);
    fill(0, 0, map(lowTot3, 0, count3*10, 0, 255));
    rect(axisX, axisY3, 5, 5);
    break;
    
    case 1:
    background(255);
    last = 0;
      if (millis() > last+2000) {
        last = millis();
        screen = 2;
      }
    break;
    
    case 5:
    background(255);
    last = 0;
      if (millis() > last+2000) {
        last = millis();
        screen = 3;
      }
    break;
    
    case 6:
    background(255);
    last = 0;
      if (millis() > last+2000) {
        last = millis();
        screen = 4;
      }
    break;
  }
}

void mouseReleased() {
  if (screen == 0) {
    if (mouseX > 155 && mouseX < 421 && mouseY > 199 && mouseY < 453) {
      screen = 1;
      walls.play();
    }
    if (mouseX > 507 && mouseX < 775 && mouseY > 199 && mouseY < 453) {
      screen = 5;
      dumb.play();
    }
    if (mouseX > 855 && mouseX < 1127 && mouseY > 199 && mouseY < 453) {
      screen = 6;
      view.play();
    }
  }
}

void reset() {
  saveFrame();
}
void stop() {
  dumb.close();
  minim.stop(); 
  super.stop();
}