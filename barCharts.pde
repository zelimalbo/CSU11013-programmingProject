//zelim added hash maps 28/03/24

import controlP5.*;
import processing.core.PApplet;
import java.util.Map;
import java.util.HashMap;

class barCharts {
  ControlP5 cp5;
  float chartX, chartY, chartWidth, chartHeight;
  Map<String, Integer> frequencies;
  color[] colors;
  PFont font1;

  // Constructor
  barCharts(ControlP5 cp5, float chartX, float chartY, float chartWidth, float chartHeight, Map<String, Integer> frequencies, color[] colors) {
    this.cp5 = cp5;
    this.chartX = chartX;
    this.chartY = chartY;
    this.chartWidth = chartWidth;
    this.chartHeight = chartHeight;
    this.frequencies = frequencies;
    this.colors = colors;
    this.font1 = createFont("Calibri", 14);
  }

  void draw() {
    // Assuming a method to find the maximum value in the map
    int maxDataValue = Collections.max(frequencies.values());
    float barWidth = chartWidth / frequencies.size();
    int i = 0;

    for (Map.Entry<String, Integer> entry : frequencies.entrySet()) {
      String label = entry.getKey();
      Integer value = entry.getValue();

      float normalizedHeight = map(value, 0, maxDataValue, 0, chartHeight);
      fill(colors[i % colors.length]); // Cycle through colors if there are more bars than colors
      rect(chartX + i * barWidth, chartY + chartHeight - normalizedHeight, barWidth - 5, normalizedHeight);
      fill(0);
      textFont(font1);
      textAlign(CENTER);
      text(label, chartX + i * barWidth + barWidth / 2, chartY + chartHeight + 15);
      text(value, chartX + i * barWidth + barWidth / 2, chartY + chartHeight - normalizedHeight - 5);
      i++;
    }
  }
}
