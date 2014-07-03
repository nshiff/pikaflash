


int displayOffset = 500;

int wait=200;
int lastTime=0;

PImage pikachu;

void setup() {
  size(2*displayOffset, 2*displayOffset);
  background(102);
  lastTime = millis();
  pikachu = loadImage("pikachu.png");
}


int x=1;
int y=0;

int xPrevious=0;
int yPrevious=0;

int directionMultiplierX = 1;
int directionMultiplierY = 0;

int delta = 1;
int deltaPrev = 1;
int newDelta;


int pikaheight = 0;

void draw() { 
  if( lastTime + wait > millis() ){
    return;
  }
  lastTime = millis();

  

  int r = (int)random(255);
  int g = (int)random(255);
  int b = (int)random(255);
  stroke( r, g, b );
  strokeWeight(abs(delta));
  line( xPrevious + displayOffset, yPrevious + displayOffset, 
  x + displayOffset, y + displayOffset );
  
  image(pikachu, mouseX-100, mouseY-100);
  
  pikaheight += 10;
  
  stroke( 0, 255, 0);
  
  

  xPrevious = x;
  yPrevious = y;  



  x += delta * directionMultiplierX;
  y += delta * directionMultiplierY;

  updateDirectionMultipliers();

  newDelta = delta + deltaPrev;
  deltaPrev = delta;
  delta = newDelta;
  
}


void updateDirectionMultipliers() {

  int prevx = directionMultiplierX;
  int prevy = directionMultiplierY;


  if ( directionMultiplierX != 0 ) {
    directionMultiplierX = 0;
    directionMultiplierY = -1 * prevx;
  } else if ( directionMultiplierY != 0 ) {
    directionMultiplierY = 0;
    directionMultiplierX = 1 * prevy;
  }
}

