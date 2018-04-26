public class Map {
  public Pixel[][] pixelMap = new Pixel[20][20];
  public PVector pixelSize = new PVector(30, 30);

  Map() {
    for (int y = 0; y < pixelMap.length; ++y) {
      for (int x = 0; x < pixelMap[0].length; ++x) {
        PVector pos = new PVector(x, y);
        PVector posScreen = new PVector(x*pixelSize.x, y*pixelSize.y);
        pixelMap[y][x] = new Pixel(pos, posScreen, pixelSize, 1);
      }
    }
  }

  public void draw() {
    for (int y = 0; y < pixelMap.length; ++y) {
      for (int x = 0; x < pixelMap[0].length; ++x) {
        pixelMap[y][x].draw();
      }
    }
  }

  public ArrayList<Pixel> getNeighbors(Pixel pixel) {
    ArrayList<Pixel> neighbors = new ArrayList<Pixel>();
    PVector posPixel = pixel.getPos();
    Pixel pixelTemp;

    if (posPixel.x>0) {
      pixelTemp = pixelMap[(int)posPixel.y][(int)posPixel.x-1];
      if (pixelTemp.getType() != 2) neighbors.add(pixelTemp);
    }
    if (posPixel.x<pixelMap[0].length-1) {
      pixelTemp = pixelMap[(int)posPixel.y][(int)posPixel.x+1];
      if (pixelTemp.getType() != 2) neighbors.add(pixelTemp);
    }
    if (posPixel.y>0) {   
      pixelTemp = pixelMap[(int)posPixel.y-1][(int)posPixel.x];
      if (pixelTemp.getType() != 2) neighbors.add(pixelTemp);
    }
    if (posPixel.y<pixelMap.length-1) { 
      pixelTemp = pixelMap[(int)posPixel.y+1][(int)posPixel.x];
      if (pixelTemp.getType() != 2) neighbors.add(pixelTemp);
    }

    return neighbors;
  }

  public boolean isaValidMap() {
    //todo
    println("Mapa válido. Comenzando con el A*");
    return true;
  }

  public Pixel getStart() {
    //Recorrer el mapa
    for (Pixel[] pp : pixelMap) {
      for (Pixel p : pp) {
        if (p.isStart) return p;
      }
    }
    println("Inicio no encontrado");
    return null;
  }

  public Pixel getEnd() {
    //Recorrer el mapa
    for (Pixel[] pp : pixelMap) {
      for (Pixel p : pp) {
        if (p.isEnd) return p;
      }
    }
    println("Final no encontrado");
    return null;
  }
}