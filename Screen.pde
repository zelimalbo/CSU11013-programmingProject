class Screen {
  ArrayList<Widget> screenWidgets;
  color backgroundColor;

  Screen(color backgroundColor) {
    screenWidgets = new ArrayList();
    this.backgroundColor = backgroundColor;
  }

  void add(Widget w) {
    screenWidgets.add(w);
  }

  void draw() {
    background(backgroundColor);
    for (int i = 0; i<screenWidgets.size(); i++) {
      Widget aWidget = (Widget)screenWidgets.get(i);
      aWidget.draw();
    }
  }
  
  int getEvent(int mx, int my) {
    for (int i = 0; i<screenWidgets.size(); i++) {
      Widget aWidget = (Widget) screenWidgets.get(i);
      int event = aWidget.getEvent(mx, my);
      if (event != EVENT_NULL) {
        return event;
      }
    }
    return EVENT_NULL;
  }
  
  ArrayList getWidgets()
  {
    return screenWidgets;
  }
}
