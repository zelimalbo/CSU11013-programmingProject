class Screen {
  ArrayList<Widget> screenWidgets;
  boolean isTable;
  boolean isHeatMap;
  boolean isLineGraph;
  boolean ispieCharts;
  color backgroundColor;
  DataTable dataTable;
  HeatMap heatMap;
  LineGraph lineGraph;
  pieCharts PieCharts;


  Screen(color backgroundColor) {
    screenWidgets = new ArrayList();
    this.backgroundColor = backgroundColor;
  }

  Screen(DataTable dataTable) {
    isTable = true;
    this.dataTable = dataTable;
  }
  
  Screen(HeatMap heatMap) {
    isHeatMap = true;
    this.heatMap = heatMap;
  }
  
  Screen(LineGraph lineGraph) {
    isLineGraph = true;
    this.lineGraph = lineGraph;
  }
  Screen(pieCharts PieCharts) {
    ispieCharts = true;
    this.PieCharts = PieCharts;
  }

  void add(Widget w) {
    screenWidgets.add(w);
  }

  void draw() {
    if (isTable) {
      dataTable.draw();
    }
    else if (isHeatMap) {
      heatMap.draw();
    }
    else if (isLineGraph) {
      lineGraph.draw();
    }
   else if (ispieCharts){
      PieCharts.draw();
    }
    else {
      background(backgroundColor);
      for (int i = 0; i<screenWidgets.size(); i++) {
        Widget aWidget = (Widget)screenWidgets.get(i);
        aWidget.draw();
      }
    }
  }
  
  int getEvent(int mx, int my) {
    if (isTable) {
      dataTable.getEvent(mx,my);
    }
    else {
      for (int i = 0; i<screenWidgets.size(); i++) {
        Widget aWidget = (Widget) screenWidgets.get(i);
        int event = aWidget.getEvent(mx, my);
        if (event != EVENT_NULL) {
          return event;
        }
      }
    }
    return EVENT_NULL;
  }
  
  ArrayList getWidgets()
  {
    return screenWidgets;
  }
}
