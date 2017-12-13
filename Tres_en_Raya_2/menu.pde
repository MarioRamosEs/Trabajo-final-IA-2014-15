float tIA = 225;
void menu(){
 
  
  tint(255, tIA);
  image(logo, width/2, 100);
  noTint();
  
  fill(0);
  text("Por Mario Ramos", 10, height-15);
  if (tIA > 0) tIA = tIA - 1;
  else estado=1;
}

float theta = 0.0;
float w=0.01,v=45,a,b,c,aa,bb,cc,tr,trr;
void onda() {
  if(random(0,20) < 2) b += 0.0001;
  if(random(0,20) < 2) b -= 0.0001;

  v += random(0,0.5); //velocidad +
  v -= random(0,0.5); //velodidad -

  theta += 0.02;
  noStroke();
  fill(200, 0, 0);
  float x = theta;

  for (int i = 0; i <= 130; i++) {
    float y = sin(x)*v; //la subida y bajada de bolas
    ellipse(i*5,y + 500,10,10);
    rect(i*5-5,y + 500-5,20,400);
    x += w; //bote
  }
}