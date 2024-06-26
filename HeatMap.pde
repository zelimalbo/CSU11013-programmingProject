/**
  * Johnny implemented HeatMap Class
  * on 26/03
  *
  * This class is being used to show the frequency of arrivals and departures in each US state compared to other US states.
  * 
  * To intiliaze a heat map use the constructor:
  *  HeatMap(PShape us, Map<String, Integer> frequencies, int xpos, int ypos) 
  *  where,
  *  us is a PShape of the map of the USA,
  *  frequencies frequencies is a map containing each state and the number of flights in that state,
  *  xpos and ypos are the x and y coordinates respectively of the top left corner of the heat map
  *
  * To draw a heat map use the .draw() method
  *
  * The drawLegend(int xpos, int ypos, int legendHeight, int legendWidth, int minValue, int maxValue) method is used within
  * the draw() method to draw a gradient from the colour representing the lowest frequencies of flights to the colour representing
  * the highest frequency of flights
*/
class HeatMap {
  
  int xpos, ypos;
  int maxValue;
  int minValue;
  
  PFont legendFont;
  PFont titleFont;
  
  Map<String, State> states = new HashMap<>();
  
  PShape usa;
  
  
  HeatMap(PShape us, Map<String, Integer> frequencies, int xpos, int ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    
    legendFont = loadFont("Calibri-24.vlw");
    titleFont = loadFont("Calibri-Bold-36.vlw");
    
    usa = us;
    
    // Calculate each states colour based on their frequencies
    maxValue = Collections.max(frequencies.values());
    minValue = Collections.min(frequencies.values());
    
    for (String state : frequencies.keySet()) {
      int frequency = frequencies.get(state);
      
      float normalisedFrequency = map(frequency, minValue, maxValue, 1, 0);
      
      int brightness = (int) (normalisedFrequency * 255.0);
      
      color stateColor = color(255, brightness, brightness);
      
      states.put(state, new State(usa.getChild(state), stateColor));
    }
  }
  
  void draw() {
    fill(#B4E5FF);
    rect(NAV_BAR_WIDTH+MARGIN, MARGIN, SCREEN_WIDTH-(MARGIN*2), SCREENY-(MARGIN*2));
    
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(titleFont);
    text("Number Of Flights (Arrivals and Departures) in US States", xpos+(SCREEN_WIDTH/2), 75);
    
    shape(usa, xpos, ypos);
    for (String state : states.keySet()) {
      fill(states.get(state).stateColor);
      try {
        states.get(state).state.disableStyle();
        shape(states.get(state).state, xpos, ypos);
      } catch (NullPointerException e) {
      }
    }
    drawLegend(xpos + 100, 700, 30, SCREENX-xpos-200, minValue, maxValue);
  }
  
  void drawLegend(int xpos, int ypos, int legendHeight, int legendWidth, int minValue, int maxValue) {
    
    float normalisedFrequency = map(minValue, minValue, maxValue, 1, 0);
    int brightness = (int) (normalisedFrequency * 255.0);
    color minColor = color(255, brightness, brightness);
    
    normalisedFrequency = map(maxValue, minValue, maxValue, 1, 0);
    brightness = (int) (normalisedFrequency * 255.0);
    color maxColor = color(255, brightness, brightness);
    
    fill(0);
    stroke(0);
    rect(xpos, ypos, legendWidth, legendHeight);
    
    for (int i = xpos; i <= xpos + legendWidth; i++) {
      float inter = map(i, xpos, xpos + legendWidth, 0, 1);
      color c = lerpColor(minColor, maxColor, inter);
      stroke(c);
      line(i, ypos, i, ypos + legendHeight);
    }
    noStroke();
    fill(255);
    textAlign(LEFT, BOTTOM);
    textFont(legendFont);
    text(minValue, xpos, ypos);
    textAlign(RIGHT, BOTTOM);
    text(maxValue, xpos+legendWidth, ypos);
  }
}
