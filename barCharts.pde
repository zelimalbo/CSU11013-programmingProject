//zelim
class barCharts {

  void draw() {
  }

  //draw a bar chart with customizable parameters
  void drawBarChart(float chartX, float chartY, float chartWidth, float chartHeight, int[] data, color[] colors, String[] labels) {
    if (data.length != colors.length || data.length != labels.length) {
      println("Error: Data, colors, and labels arrays must have the same length.");
      return;
    }

    float maxDataValue = max(data);
    float barWidth = chartWidth / data.length;

    for (int i = 0; i < data.length; i++) {
      float normalizedHeight = map(data[i], 0, maxDataValue, 0, chartHeight);
      fill(colors[i]);
      rect(chartX + i * barWidth, chartY + chartHeight - normalizedHeight, barWidth - 5, normalizedHeight);

      fill(0);
      textAlign(CENTER);
      text(labels[i], chartX + i * barWidth + barWidth / 2, chartY + chartHeight + 15);
    }
  }

  void dateOnly() {
    int[] data = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 7, 8, 9, 20, 1, 2, 3, 4, 5, 6, 7, 8, 9, 30, 31};
    color[] colors = {#800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16};
    String[] labels = {"1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th", "9th", "10th", "11th", "12th", "13th", "14th", "15th", "16th", "17th", "18th", "19th", "20th", "21st", "22nd", "23rd", "24th", "25th", "26th", "27th", "28th", "29th", "30th", "31st"};

    drawBarChart(400, 200, 900, 500, data, colors, labels); // Draw the chart with specified parameters
  }

  void originOnly() {
  }

  void destinationOnly() {
  }
}