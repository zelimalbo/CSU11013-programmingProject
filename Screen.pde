/*
  Johnny implemented Screen class
  03/04
*/
class Screen {
  ArrayList<Widget> screenWidgets;
  
  boolean isTable;
  boolean isHeatMap;
  boolean isLineGraph;
  boolean isPieChart;
  boolean isBarChart;
  
  color backgroundColor;
  
  DataTable dataTable;
  HeatMap heatMap;
  LineGraph lineGraph;
  pieCharts pieChart;
  barCharts barChart;
  

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
  
  Screen(pieCharts pieChart) {
    isPieChart = true;
    this.pieChart = pieChart;
  }
  
  Screen(barCharts barChart) {
    isBarChart = true;
    this.barChart = barChart;
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
    else if (isPieChart) {
      pieChart.draw();
    }
    else if (isBarChart) {
      barChart.draw();
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
