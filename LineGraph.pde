/*
  Johnny implemented LineGraph class
  on 26/03
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
    
    maxValue = Collections.max(frequencies.values());
    minValue = Collections.min(frequencies.values());
    //print(maxValue);
    
    xAxisSpacing = graphWidth / frequencies.size();
    
    // Johnny updated to make rounded y-axis labels on 04/04
    float increment = maxValue / numberOfYLabels;
    float orderOfMagnitude;
    
    if (maxValue % numberOfYLabels != 0) {
      int difference = numberOfYLabels - (maxValue % numberOfYLabels);
      maxValue = maxValue + difference;
    }
    //print(maxValue);
    
    yAxisIncrement = maxValue/numberOfYLabels;
    
    for (int i = 0; i <= numberOfYLabels; i++) {
      labels.add(yAxisIncrement * i);
    }
    
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
      //print(points.get(i) + " ");
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
