// HISTOGRAM CLASS
// - Johnny Hancu
class Histogram {
  final int GAP = 5;
  final int NUM_Y_LABELS = 9;
  int y_label_gap = 60;
  int[] coords;
  int xpos, ypos;
  int bar_size;
  int max_value;
  int y_label_increment;
  PFont label_font = loadFont("Calibri-14.vlw");
  
  Histogram(int[] data, int xpos, int ypos) {
    coords = data;
    this.xpos = xpos;
    this.ypos = ypos;
    bar_size = (GRAPH_WIDTH - (GAP * (data.length + 1))) / data.length;
    max_value = data[0];
    for (int index = 1; index < data.length; index++) {
      if (data[index] > max_value) {
        max_value = data[index];
      }
    }
    y_label_increment = max_value / NUM_Y_LABELS;
    //println(max_value);
  }
  
  
  void draw() {
    fill(255);
    stroke(0);
    rect(xpos, ypos, GRAPH_WIDTH, GRAPH_HEIGHT);
    fill(#0FC3D8);
    for (int x = 0; x < coords.length; x++) {
      rect((x*(bar_size+GAP))+xpos+GAP, GRAPH_HEIGHT-coords[x]+ypos, bar_size, coords[x]);
    }
    fill(0);
    textFont(label_font);
    int current_label = 0;
    text("0", xpos - 30, GRAPH_HEIGHT+ypos);
    for (int y = NUM_Y_LABELS; y > 0; y--) {
      int label_y_pos = -1*y*y_label_gap+GRAPH_HEIGHT+ypos;
      int label_x_pos_1 = xpos - 3;
      int label_x_pos_2 = xpos + 3;
      line(label_x_pos_1, label_y_pos, label_x_pos_2, label_y_pos);
      current_label += y_label_increment;
      text(String.valueOf(current_label), xpos - 30, -1*y*y_label_gap+GRAPH_HEIGHT+ypos);
    }
  }
}
