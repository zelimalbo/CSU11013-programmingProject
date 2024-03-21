//Adam
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
 
  void drawValues(String[] values, color[] colors, float textSize) {
  // Display each value in the array
  for (int i = 0; i < values.length; i++) {
    // Draw a colored square next to each value
    fill(colors[i]);
    rect(1170, 185 + i * textSize * 1.5, 20, 20); // adjusted rectangle position
    fill(0);
    // Display each value
    text(values[i], 1200, 200 + i * textSize * 1.5); // Adjusted text position
  }
  }
 
  void lateOnly() {
    String[] originList = {"ORD", "STL", "AUS"};
    int[] lateStatus = {90, 200, 90};
    color[] colors = {#D32F2F, #03A9F4, #0E7480};
    float textSize = 20;
    drawPieChart(850, 350, colors, 400, lateStatus);
    drawValues(originList, colors, textSize);
  }

  void cancelledOnly() {
    String[] originList = {"ORD", "STL", "AUS"};
    int[] cancelStatus = {120, 240};
    color[] colors = {#D32F2F, #03A9F4};
    float textSize = 20;
    drawPieChart(850, 350, colors, 200, cancelStatus);
    drawValues(originList, colors, textSize);
  }
 

}
