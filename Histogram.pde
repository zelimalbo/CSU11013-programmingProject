// HISTOGRAM CLASS
// - Johnny Hancu
class Histogram {
  final int GRAPH_HEIGHT = 400;
  final int GRAPH_WIDTH = 400;
  int[] coords = new int[]{12, 45, 222, 111, 111};
  
  void draw() {
    fill(255);
    stroke(0);
    int xMargin = (SCREENX - GRAPH_WIDTH) / 2;
    int yMargin = (SCREENY - GRAPH_HEIGHT) / 2;
    rect(xMargin, yMargin, GRAPH_WIDTH, GRAPH_HEIGHT);
    for (int x = 0; x < coords.length; x++) {
      rect(x*30+xMargin+20, GRAPH_HEIGHT-coords[x]+yMargin, 30, coords[x]);
    }
  }
}
