//zelim
class barCharts {
  
  void draw(){
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
  }

  void originOnly() {
  }

  void destinationOnly() {
  }
}
