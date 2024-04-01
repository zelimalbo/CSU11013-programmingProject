import controlP5.*;
import processing.core.PApplet;
import java.util.Map;
import java.util.Collections;

class barCharts {
  ControlP5 cp5;
  float chartX, chartY, chartWidth, chartHeight;
  Map<String, Integer> frequencies;
  int[] colors; // Use an int array for colors
  PFont font1;

  // Constructor
  barCharts(float chartX, float chartY, float chartWidth, float chartHeight, Map<String, Integer> frequencies) {
    this.cp5 = cp5;
    this.chartX = chartX; // Correct assignment to instance variables
    this.chartY = chartY;
    this.chartWidth = chartWidth;
    this.chartHeight = chartHeight;
    this.frequencies = frequencies;
    this.font1 = createFont("Calibri", 14);

    // Initialize the colors array with Processing's color function
    this.colors = new int[]{
      color(0xFF00FF00), // #00FF00
      color(0xFFFF0000), // #FF0000
      color(0xFF0066FF), // #0066FF
      color(0xFFFF33CC), // #FF33CC
      color(0xFF006666), // #006666
      color(0xFF660033), // #660033
      color(0xFF999966)  // #999966
    };
  }

  void draw() {
    int maxDataValue = Collections.max(frequencies.values());
    float barWidth = chartWidth / frequencies.size();
    int i = 0;

    for (Map.Entry<String, Integer> entry : frequencies.entrySet()) {
      float normalizedHeight = map(entry.getValue(), 0, maxDataValue, 0, chartHeight);
      fill(colors[i % colors.length]); // Cycle through the colors using int color values
      rect(chartX + i * barWidth, chartY + chartHeight - normalizedHeight, barWidth - 5, normalizedHeight);
      fill(0);
      textFont(font1);
      textAlign(CENTER);
      text(entry.getKey(), chartX + i * barWidth + barWidth / 2, chartY + chartHeight + 15);
      text(entry.getValue().toString(), chartX + i * barWidth + barWidth / 2, chartY + chartHeight - normalizedHeight - 5);
      i++;
    }
  }
}
