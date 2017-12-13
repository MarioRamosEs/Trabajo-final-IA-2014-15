//0 = Empate o aun no se ha ganado
//1 = Gana jugador 
//2 = Gana maquina

int Resultado(int[] tablerox) {
  // Iz - Der
  if (tablerox[1] == 2 && tablerox[2] == 2 && tablerox[0] == 2) return 2;
  if (tablerox[4] == 2 && tablerox[5] == 2 && tablerox[3] == 2) return 2;
  if (tablerox[7] == 2 && tablerox[8] == 2 && tablerox[6] == 2) return 2;

  // Arriba - Abajo
  if (tablerox[0] == 2 && tablerox[3] == 2 && tablerox[6] == 2) return 2;
  if (tablerox[1] == 2 && tablerox[4] == 2 && tablerox[7] == 2) return 2;
  if (tablerox[2] == 2 && tablerox[5] == 2 && tablerox[8] == 2) return 2;

  //Diagonales
  if (tablerox[0] == 2 && tablerox[4] == 2 && tablerox[8] == 2) return 2;
  if (tablerox[6] == 2 && tablerox[4] == 2 && tablerox[2] == 2) return 2;


  if (tablerox[1] == 1 && tablerox[2] == 1 && tablerox[0] == 1) return 1;
  if (tablerox[4] == 1 && tablerox[5] == 1 && tablerox[3] == 1) return 1;
  if (tablerox[7] == 1 && tablerox[8] == 1 && tablerox[6] == 1) return 1;

  // Arriba - Abajo
  if (tablerox[0] == 1 && tablerox[3] == 1 && tablerox[6] == 1) return 1;
  if (tablerox[1] == 1 && tablerox[4] == 1 && tablerox[7] == 1) return 1;
  if (tablerox[2] == 1 && tablerox[5] == 1 && tablerox[8] == 1) return 1;

  //Diagonales
  if (tablerox[0] == 1 && tablerox[4] == 1 && tablerox[8] == 1) return 1;
  if (tablerox[6] == 1 && tablerox[4] == 1 && tablerox[2] == 1) return 1;

  return(0);
}
