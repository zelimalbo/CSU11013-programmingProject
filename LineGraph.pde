/**
  * Johnny implemented LineGraph class
  * on 26/03
  *
  * This class is currently being used in Main to display the frequencies of flights each day.
  * This class can be used to represent other frequencies if required.
  *
  * To initialize a line graph use the constructor:
  *  LineGraph(int xpos, int ypos, int graphHeight, int graphWidth, Map<String, Integer> frequencies)
  *  where,
  *  xpos and ypos are the x and y coordinates respectively of the top left corner of the graph,
  *  graphHeight and graphWidth are the dimensions of the graph,
  *  and frequencies is a map containing single occurances of data and their frequency, i.e. 01/01/2023: 20000
  *
  * To draw the line graph use the .draw() method
*/
class LineGraph {
  
  int xpos, ypos;
  int graphHeight, graphWidth;
  int xAxisSpacing;
  int numberOfYLabels = 12;
  int yAxisIncrement;
  int maxValue, minValue;
  int topMargin = 10;
  ArrayList<Integer> labels = new ArrayList();
  ArrayList<Integer> points = new ArrayList();
  
  PFont labelFont = loadFont("Calibri-14.vlw");
  PFont titleFont = loadFont("Calibri-Bold-36.vlw");
  PFont headerFont = loadFont("Calibri-24.vlw");
  
  Map<String, Integer> frequencies;
  
  LineGraph(int xpos, int ypos, int graphHeight, int graphWidth, Map<String, Integer> frequencies) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.graphHeight = graphHeight;
    this.graphWidth = graphWidth;
    this.frequencies = frequencies;
    
    // Calculate the spacing of points on the x-axis
    maxValue = Collections.max(frequencies.values());
    minValue = Collections.min(frequencies.values());
    
    xAxisSpacing = graphWidth / frequencies.size();
    
    yAxisIncrement = maxValue/numberOfYLabels;
    
    for (int i = 0; i <= numberOfYLabels; i++) {
      labels.add(yAxisIncrement * i);
    }
    
    // Get y coordinates of data points
    for (String dataPoint : frequencies.keySet()) {
      int point = (int) map(frequencies.get(dataPoint), 0, maxValue, 700, 100+topMargin);
      print(frequencies.get(dataPoint) + ", ");
      points.add(point);
    }
  }
  
  void draw() {
    fill(#B4E5FF);
    rect(NAV_BAR_WIDTH+MARGIN, MARGIN, SCREEN_WIDTH-(MARGIN*2), SCREENY-(MARGIN*2));
    
    stroke(0);
    fill(255);
    rect(xpos, ypos, graphHeight, graphWidth);
    
    fill(0);
    textAlign(RIGHT, CENTER);
    textFont(labelFont);
    
    strokeWeight(0.1);
    for (int i = 0; i <= numberOfYLabels; i++) {
      String label = Integer.toString(labels.get(i));
      text(label, xpos-10, (SCREENY-ypos) - (i*((graphHeight-topMargin)/numberOfYLabels)));
      line(xpos, (SCREENY-ypos) - (i*((graphHeight-topMargin)/numberOfYLabels)), xpos+graphWidth, (SCREENY-ypos) - (i*((graphHeight-topMargin)/numberOfYLabels)));
    }
    
    int previousPoint = points.get(0);
    textAlign(CENTER, TOP);
    text(1, xpos+(xAxisSpacing/2), ypos+graphHeight+10);
    strokeWeight(0.1);
    line(xpos+(xAxisSpacing/2), ypos, xpos+(xAxisSpacing/2), ypos+graphHeight);
    int increment = 0;
    
    strokeWeight(2);
    for (int i = 1; i < points.size(); i++) {
      fill(0);
      strokeWeight(2);
      text(i+1, xpos+increment+xAxisSpacing+(xAxisSpacing/2), ypos+graphHeight+10);
      stroke(#0043C6);
      line(xpos+increment+(xAxisSpacing/2), previousPoint, xpos+increment+xAxisSpacing+(xAxisSpacing/2), points.get(i));
      stroke(0);
      strokeWeight(0.1);
      line(xpos+increment+xAxisSpacing+(xAxisSpacing/2), ypos, xpos+increment+xAxisSpacing+(xAxisSpacing/2), ypos+graphHeight);
      previousPoint = points.get(i);
      increment += xAxisSpacing;
    }
    strokeWeight(1);
    
    textAlign(CENTER, CENTER);
    textFont(titleFont);
    text("Number of Flights Per Day", xpos + (graphWidth/2), ypos-50);
    textFont(headerFont);
    text("Day (January 2022)", xpos + (graphWidth/2), ypos+graphHeight+50);
    text("Number\nof\nFlights", xpos-125, ypos+300);
  }
}
