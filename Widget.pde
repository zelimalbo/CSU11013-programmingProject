class Widget {
  int xpos, ypos, widgetHeight, widgetWidth;
  String label;
  int event;
  color widgetColor, labelColor, lineColor;
  PFont widgetFont;
  
  Widget(int x, int y, int widgetWidth, int widgetHeight, String label,
    color widgetColor, PFont widgetFont, int event) {
    this.xpos=x;
    this.ypos=y;
    this.widgetWidth = widgetWidth;
    this.widgetHeight = widgetHeight;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    labelColor= color(0);
    lineColor= color(0);
  }
  
  void draw() {
    fill(widgetColor);
    stroke(lineColor);
    rect(xpos, ypos, widgetWidth, widgetHeight);
    fill(labelColor);
    text(label, xpos+widgetWidth/2, ypos+(widgetHeight/2));
  }
  
  void mouseOver() {
    lineColor = color(255);
  }
  
  void mouseNotOver() {
    lineColor = color(0);
  }
  
  int getEvent(int mX, int mY) {
    if (mX>xpos && mX < xpos+widgetWidth && mY >ypos && mY <ypos+widgetHeight) {
      print("yes");
      return event;
    }
    return EVENT_NULL;
  }
}