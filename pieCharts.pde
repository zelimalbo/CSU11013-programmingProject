//adam

class pieCharts {


  int xpos, ypos;
  int diameter;
  Map<String, Integer> frequencies;
  PFont titleFont = loadFont("Calibri-14.vlw");
  

  pieCharts(int xpos, int ypos, int diameter, Map<String, Integer> frequencies) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.diameter = diameter;
    this.frequencies = frequencies;
  }

void draw() {
  fill(#B4E5FF);
  rect(NAV_BAR_WIDTH+MARGIN, MARGIN, SCREEN_WIDTH-(MARGIN*2), SCREENY-(MARGIN*2));

  float lastAngle = 0;
  float total = 0;
  for (int value : frequencies.values()) {
    total += value;
  }

  int index = 0;
  color[] colors = new color[frequencies.size()]; // Store colors for legend
  for (String label : frequencies.keySet()) {
    float angle = map(frequencies.get(label), 0, total, 0, TWO_PI);
    colors[index] = color(255, map(index, 0, frequencies.size(), 0, 255), map(index, 0, frequencies.size(), 255, 0)); // Store color
    fill(colors[index]);
    arc(xpos, ypos, diameter, diameter, lastAngle, lastAngle + angle);
    lastAngle += angle;
    index++;
  }

  textAlign(LEFT, CENTER);
  textFont(titleFont);
  text("Pie Chart", xpos, ypos - diameter / 2 - 20);

  // Legend for frequencies, displaying each frequency next to its color
  float legendX = xpos + diameter / 2 + 80; // Adjust as needed
  float legendY = ypos - diameter / 2;
  index = 0; // Reset index for legend
  for (String label : frequencies.keySet()) {
    fill(colors[index]);
    rect(legendX, legendY, 15, 15); // Draw color box
    fill(0); // Black text
    int freq = frequencies.get(label);
    text(label, legendX + 40, legendY + 7); // Display frequency next to the color box
    legendY += 20; // Move to next line in legend
    index++;
  }
}
}
