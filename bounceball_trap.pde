# gogatsusai
Circle[] circles = new Circle[10];

void def_display(){
  int m=millis();
 
 if(1000<m){
   textSize(50);
   text("Start",250,150);
   fill(15,140,240);
 }
}

void setup()
{
  size(600, 400);
  smooth();  
  noStroke();
  fill(0);
  
 for (int i = 0; i < circles.length; i ++) {
   circles[i] = new Circle(5*i,i*10, i*4, 2*sqrt(i), 2*sqrt(i));
 }
 
}
 
void draw() {
  background(255); 
  
  for (int i = 0; i < circles.length; i ++) {
    circles[i].update();
    circles[i].display();
  }
}
 
class Circle {
  float xPos, yPos, eSize, xspeed,yspeed;
  int a,b,c;
 
  Circle (float _x,float _y, int _eSize, float _xspeed,float _yspeed) {    //初期化用のメソッド（コンストラクタ）
    xPos = _x;    //x座標の初期値は0.0
    yPos = _y;     //y座標の初期値はオブジェクトを宣言した際の引数になる
    eSize = _eSize;
    xspeed = _xspeed;
    yspeed=_yspeed;//speedの初期値もオブジェクト宣言の際の引数
  }
 
  //円の位置を更新するメソッド
  void update() {
    xPos =xPos+xspeed;
    yPos =yPos+yspeed;
    
    int dif=30;//10-50
  

  if ((xPos > width) || (xPos < 0)||((mouseX-dif<xPos)&&(xPos<mouseX+dif)&&(mouseY-dif<yPos)&&(yPos<mouseY+dif))) {
  xspeed = xspeed * -1;
  a=(int)random(255);
  b=(int)random(255);
  c=(int)random(255);
  }
  if ((yPos > height) || (yPos < 0)||((mouseX-dif<xPos)&&(xPos<mouseX+dif)&&(mouseY-dif<yPos)&&(yPos<mouseY+dif))) {
  yspeed = yspeed * -1;
  a=(int)random(255);
  b=(int)random(255);
  c=(int)random(255);
  }
  if((yPos<mouseY+dif/2)&&(yPos>mouseY-dif/2)&&(xPos<mouseX+dif/2)&&(xPos>mouseX-dif/2)){
  textSize(20);
  text("trapped!",xPos,yPos);
  fill(a,b,c);
  xspeed=yspeed=0;
  }
  
  }
 
  void display(){
    stroke(0);
    fill(a,b,c);
    ellipse(xPos, yPos, eSize, eSize);    //円を描く
  }
}
