int Minimax(int[] TableroFuncion) {
  int[] TableroRespuestas = new int[9];
  arrayCopy(TableroFuncion, TableroRespuestas);

  //Expande el arbol
  for (int i=0; i<9; i++) {
    if (TableroRespuestas[i] == 0) TableroRespuestas[i] = fMin(TableroFuncion, i);
    else TableroRespuestas[i] = -200; //Se le da este valor para que no se seleccione en la busqueda de la mejor opcion, porque ya esta usado.
  }

  //Busqueda de la mejor opcion
  int Indice = 0;
  int MaximaPuntuacion = -200;
  for (int i=0; i<9; i++) {
    if (TableroRespuestas[i] > MaximaPuntuacion) {
      MaximaPuntuacion = TableroRespuestas[i];
      Indice = i; //Mejor posicion en el tablero
    }
  }
  return Indice;
}

int fMin(int []TableroFuncion, int Posicion) { //Movimiento de la maquina
  int[] TableroRespuestas = new int[9];
  int[] NuevoTablero = new int[9];
  arrayCopy(TableroFuncion, NuevoTablero);

  NuevoTablero[Posicion] = 2; //Marca la casilla como jugada por la maquina

  //Compruebo si puedo acabar
  if (Resultado(NuevoTablero) == 2) return 100; //Gana la maquina
  if (Resultado(NuevoTablero) == 1) return -100; //Gana el jugador lel
  if (TableroLleno(NuevoTablero)) return 0; //Empate

  //Sigo expandiendo
  for (int i=0; i<9; i++) {
    if (NuevoTablero[i] == 0) TableroRespuestas[i] = fMax(NuevoTablero, i); 
    else TableroRespuestas[i] = 200; //Se pone este valor para que no lo seleccione al Returnear, porque ya esta usado.
  }

  //VUELTA
  if (min(TableroRespuestas) == 200) return(0); //Empate
  else return min(TableroRespuestas);
}

int fMax(int []TableroFuncion, int Posicion) { //Movimiento simulado del humano
  int[] TableroRespuestas = new int[9];
  int[] NuevoTablero = new int[9];
  arrayCopy(TableroFuncion, NuevoTablero);

  NuevoTablero[Posicion] = 1; //Marca la casilla como jugada por el humano

  //Compruebo si puedo acabar
  if (Resultado(NuevoTablero) == 2) return 100; //Gana la maquina
  if (Resultado(NuevoTablero) == 1) return -100; //Gana el jugador lel
  if (TableroLleno(NuevoTablero)) return 0; //Empate

  //Sigo expandiendo
  for (int i=0; i<9; i++) {
    if (NuevoTablero[i] == 0) TableroRespuestas[i] = fMin(NuevoTablero, i); 
    else TableroRespuestas[i] = -200; //Se pone este valor para que no lo seleccione al Returnear, porque ya esta usado.
  }

  //VUELTA
  if (max(TableroRespuestas) == -200) return 0; //Empate
  else return max(TableroRespuestas);
}

boolean TableroLleno(int[] ntablero) {
  if (ntablero[0] != 0 && ntablero[1] != 0 && ntablero[2] != 0 && ntablero[3] != 0 && ntablero[4] != 0 && ntablero[5] != 0 && ntablero[6] != 0 && ntablero[7] != 0 && ntablero[8] != 0) return true;
  else return false;
}