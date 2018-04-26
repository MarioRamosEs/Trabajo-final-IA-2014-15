public class Astar {
  private ArrayList<Pixel> blackList = new ArrayList<Pixel>();
  private PriorityQueue pq = new PriorityQueue();
  private Map map;

  private Pixel start, end;

  Astar(Map map) {
    this.map = map;
  }

  public Pixel analyzePixel(Pixel pixel) {
    if (pixel.isEnd) {
      println("Solucion encontrada"); 
      return pixel;
    }

    blackList.add(pixel);
    ArrayList<Pixel> neighbors = map.getNeighbors(pixel);
    for (Pixel p : neighbors) { //Añadimos a pq los pixels de neighbors que no estén. Ya se ordenan solos al ser una PriorityQueue
      if (!pq.contains(p) && !blackList.contains(p)) {
        println(p.getPos());
        p.setFather(pixel);
        p.g = pixel.g + 1;
        p.h = p.calculateH(start.getPos());
        p.f = p.g + p.h;
        pq.add(p);
      }
    }

    if (pq.isEmpty()) {
      return null;
    }

    //Cogemos el primer elemento de la Cola y llamamos a la funcion recursivamente
    Pixel p = (Pixel) pq.poll();
    return analyzePixel(p);
  }

  public void init() {
    if (map.isaValidMap()) {
      start = map.getStart();
      end   = map.getEnd();   
      Pixel solution = analyzePixel(map.getStart());

      if (solution == null) println("Camino no encontrado");
      else solution.father.setPath(); //Rebuild Path
    
    } else {
      println("Mapa no válido");
    }
  }
}