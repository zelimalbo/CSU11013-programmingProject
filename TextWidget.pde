/*
  Added TextWidget class
  Johnny
  20/03
*/
class TextWidget extends Widget {
  int maxlen;

  TextWidget(int xpos, int ypos, int widgetWidth, int widgetHeight,
    String label, color widgetColor, PFont font, int event, int maxlen) {
    super(xpos, ypos, widgetWidth, widgetHeight, label, widgetColor, font, event);
    /*
    this.xpos=xpos;
    this.ypos=ypos;
    this.widgetWidth = widgetWidth;
    this.widgetHeight= widgetHeight;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=font;
    labelColor=color(0);
    */
    this.maxlen=maxlen;
  }
  void append(char s) {
    if (s==BACKSPACE) {
      if (!label.equals(""))
        label=label.substring(0, label.length()-1);
    } else if (label.length() <maxlen)
      label=label+str(s);
  }
}
