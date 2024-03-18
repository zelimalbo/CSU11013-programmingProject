//zelim
class pieCharts {

   void draw(){
  }
  // Draw a pie chart at a specified position with given colors, diameter, and status values
  void drawPieChart(float pieX, float pieY, color[] colors, float diameter, int[] values) {
    float lastAngle = 0;
    for (int i = 0; i < values.length; i++) {
      fill(colors[i]);
      // Use pieX and pieY for the position of the pie chart
      arc(pieX, pieY, diameter, diameter, lastAngle, lastAngle + radians(values[i])); 
      lastAngle += radians(values[i]);
    }
  }

  void lateOnly() {
    int[] lateStatus = {90, 200, 30, 60};
    color[] colors = {#D32F2F, #03A9F4, #FF0000};
    drawPieChart(300, 300, colors, 200, lateStatus);
  }

  void cancelledOnly() {
    int[] cancelStatus = {120, 240};
    color[] colors = {#D32F2F, #03A9F4};
    drawPieChart(300, 300, colors, 200, cancelStatus);
  }
  

}
