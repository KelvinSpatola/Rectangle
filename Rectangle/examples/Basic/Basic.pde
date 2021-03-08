import kelvinclark.Rectangle;

Rectangle r0, r1, r2;
int bgColor = 255;

void setup() {
  size(900, 600);
  r0 = new Rectangle(this);
  r1 = new Rectangle(this, 125);
  r2 = new Rectangle(r1);
}

void draw() {
  background(bgColor);
  strokeWeight(5);

  push();
  rectMode(CENTER);
  translate(width/4, height/2);
  fill(r0.contains(mouseX, mouseY) ? color(0, 255, 0) : 120);
  r0.draw();
  pop();

  push();
  rectMode(CORNER);
  translate(width/2, height/2);
  rotate(frameCount*0.02f);
  fill(r1.contains(mouseX, mouseY) ? color(0, 255, 0) : 120);
  r1.draw();
  pop();

  push();
  rectMode(CENTER);
  translate(3*width/4, height/2);
  rotate(frameCount*0.02f);
  scale(2f, 0.5f);
  noStroke();
  fill(r2.contains(mouseX, mouseY) ? color(0, 255, 0) : 120);
  r2.draw();
  bgColor = r2.contains(mouseX, mouseY) ? #FF0000 : #FFFFFF;
  pop();
}

void keyPressed() {
  float size = 2;
  if (keyCode == LEFT) r0.width -= size;
  if (keyCode == RIGHT) r0.width += size;
  if (keyCode == UP) r0.height += size;
  if (keyCode == DOWN) r0.height -= size;
  println(r0.getArea());
}
