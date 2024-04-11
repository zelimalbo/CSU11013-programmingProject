//adam
class pieCharts {
  int xpos, ypos;
  int diameter;
  Map<String, Integer> frequencies;
  PFont titleFont = loadFont("Calibri-14.vlw");
  PFont bigFont = loadFont("Calibri-24.vlw");

  pieCharts(int xpos, int ypos, int diameter, Map<String, Integer> frequencies) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.diameter = diameter;
    this.frequencies = frequencies;
  }

  void draw() {
    fill(#B4E5FF);
    rect(NAV_BAR_WIDTH + MARGIN, MARGIN, SCREEN_WIDTH - (MARGIN * 2), SCREENY - (MARGIN * 2));

    float lastAngle = 0;
    float total = 0;
    for (int value : frequencies.values()) {
      total += value;
    }

    // Convert Map entries to a list and sort by value (frequency)
    List<Map.Entry<String, Integer>> entries = new ArrayList<Map.Entry<String, Integer>>(frequencies.entrySet());
    Collections.sort(entries, new Comparator<Map.Entry<String, Integer>>() {
      @Override
      public int compare(Map.Entry<String, Integer> a, Map.Entry<String, Integer> b) {
        return a.getValue().compareTo(b.getValue());
      }
    });

    colorMode(HSB, 360, 100, 100); // Use HSB color mode
    color[] colors = new color[frequencies.size()]; // Store colors for legend
    int index = 0;
    for (Map.Entry<String, Integer> entry : entries) { // Iterate over sorted entries
      float angle = map(entry.getValue(), 0, total, 0, TWO_PI);
      // Evenly distribute hues around the color wheel
      colors[index] = color(map(index, 0, frequencies.size(), 0, 360), 80, 90); // Adjust saturation and brightness as needed
      fill(colors[index]);
      stroke(0); // Set stroke color to black
      strokeWeight(2); // Set stroke weight
      arc(xpos, ypos, diameter, diameter, lastAngle, lastAngle + angle);
      lastAngle += angle;
      index++;
    }

    colorMode(RGB, 255); // Switch back to RGB color mode for text and other elements
    noStroke(); // Disable stroke for text and legend
    fill(0);
    textAlign(LEFT, CENTER);
    textFont(bigFont);
    text("NUMBER OF US FLIGHTS PER DATE", xpos - 165, ypos - diameter / 2 - 40); // Updated title

    // Legend
    float legendX = xpos + diameter / 2 + 80;
    float legendY = ypos - diameter / 2;
    index = 0; // Reset index for legend
    textFont(titleFont);
    for (Map.Entry<String, Integer> entry : entries) { // Use sorted entries for legend
      fill(colors[index]);
      rect(legendX, legendY, 15, 15); // Draw color box
      fill(0); // Black text for labels
      text(entry.getKey() + ": " + entry.getValue(), legendX + 20, legendY + 7);
      legendY += 20; // Move to the next line in legend
      index++;
    }
  }
}
