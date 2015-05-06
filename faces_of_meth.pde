PImage img;
PImage imgMsk;

boolean on = true;
int x = 0;
int y = 0;
int rate = 2;
int rnd = 0;
int ind = 0;

void setup() {
  size(1280, 720);
  
  img = loadImage(ind+".png");
  imgMsk = loadImage("margen.png");
  delay(1000);
}

void draw() {
  background(0);
  
  if(on){
  if(rnd == 0)
    image(img,0-x,0-y);
  if(rnd == 1)
    image(img,x,y-720);
  }
  
  if(on){
    if(rnd == 0){
      x+=rate;
      if( x >= 720)
        on=false;
      y+=rate;
      if( y >= 720)
        on=false;
    }
    if(rnd == 1){
      x-=rate;
      if( x <= -720)
        on=false;
      y+=rate;
      if( y <= -720)
        on=false;
    }
  }
  if(!on){
    on = true;
    rnd = int(random(2));
    ind++;
    x=0;y=0;
    if(ind==44)
      ind=0;
    img = loadImage(ind+".png");
  }
  
  image(imgMsk,0,0);
}

