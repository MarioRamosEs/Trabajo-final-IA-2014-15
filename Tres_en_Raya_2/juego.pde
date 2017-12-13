void juego() {
  
  fill(0);
  text("Por Mario Ramos", 10, height-15);
  PintarTablero();
  PintarLineas();

  if (turno == 2 && !lleno) {
    tablero[Minimax(tablero)] = 2;
    turno = 1;
  } else {
    if (mousePressed == true && Resultado(tablero) == 0) {
      xx = (mouseX/200);
      yy = (mouseY/200);
      if (turno == 1 && tablero[yy*ancho+xx] == 0) { 
        tablero[yy*ancho+xx] = 1; 
        turno = 2;
      }
    }
  }
  //println(Resultado(tablero));
}

boolean lleno = false;
void PintarTablero() {
  imageMode(CORNER);
  lleno = true;
  for (int y=0; y<alto; y++) {
    for (int x=0; x<ancho; x++) {
      pintar = tablero[y*ancho+x];
      if (pintar == 0) {
        fill(225, 100);
        lleno = false;
      }
      tint(225, 215);
      if (pintar == 1)image(cruz, x*200, y*200, 200, 200);
      if (pintar == 2)image(circulo, x*200, y*200, 200, 200);
    }
  }

}

void PintarLineas() {
  stroke(255);
  strokeWeight(4);
  line(198, 0, 198, height);
  line(398, 0, 398, height);
  line(0, 198, width, 198);
  line(0, 398, width, 398);
}