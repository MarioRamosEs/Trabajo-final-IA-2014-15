//Version 2.4

int temp, temp2;
boolean acabado = false;
int [] tablero = {
  0, 0, 0, 
  0, 0, 0, 
  0, 0, 0, 
};

int xx, yy, pintar, q;

PImage logo, fin, cruz, circulo, loser;
int ancho = 3;
int alto = 3;
int turno = 1;
int estado = 0;

void setup() {
  size(600, 600);
  imageMode(CENTER);
  logo = loadImage("logo.png");
  fin = loadImage("empate.png");
  cruz = loadImage("X.png");
  circulo = loadImage("O.png");
  loser = loadImage("loser.png");
}

void draw() {
  background(0);
  onda();
  switch(estado) {
  case 0:
    menu();
    break;
  case 1:
    comprobando();
    break;
  }
}

void comprobando() {  
  if (!acabado)juego();
  else{
    imageMode(CENTER);
    if (Resultado(tablero) == 2) image(loser, width/2, height/2);
    if (lleno) image(fin, width/2, height/2);
    if (temp+5000<millis()) reset();
    if (temp2+3000<millis()) reset();
  }

  if (Resultado(tablero) == 0 && !lleno) temp = millis();
  if (temp+2000<millis()) acabado = true;
  else temp2=millis();
}

void reset() {
  temp=millis();
  temp2=millis();
  turno = 1;
  tablero = new int [] {
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0, 
  };
  acabado = false;
}