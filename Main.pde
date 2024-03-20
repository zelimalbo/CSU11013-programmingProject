import controlP5.*;
import java.util.*;
import java.util.Collections;

final int SCREENX = 1400;
final int SCREENY = 800;
final int NAV_BAR_WIDTH = 300;
final int GRAPH_HEIGHT = 600;
final int GRAPH_WIDTH = 600;

final int EVENT_NULL = 0;
final int EVENT_SORT_BY_STATE = 1;

PFont stdFont;

// Shapes for map - Johnny Hancu 13/03
PShape usa;
PShape texas; // Test coloring an individual state

barCharts barCharts;
pieCharts pieCharts;

NavBar NavBar;

NavBar tempNavBar = new NavBar();

void setup() {
  stdFont = loadFont("Calibri-14.vlw");
  size(1400, 800);
  DataSorting data = new DataSorting();   // Implemented DataSorting class Julius Jogela 14/03/24
  data.setup();
  println("There are " + data.numberOfFlights + " flights in the dataset");

  //Added NavBar Eoghan Gloster 14/2/23
  //Cleaned up Main by moving back into NavBar 20/2/23
  tempNavBar.dateList = new ControlP5(this);
  tempNavBar.originList = new ControlP5(this);
  tempNavBar.destinationList = new ControlP5(this);
  tempNavBar.searchButton = new ControlP5(this);
  tempNavBar.setup();
  //Added NavBar Eoghan Gloster 14/2/23^^
  
  usa = loadShape("us.svg");
  texas = usa.getChild("TX");
  //barCharts = new barCharts();
  //pieCharts = new pieCharts();
}

void draw() {
  background(245);
  noStroke();
  fill(200);
  rect(0, 0, 300, SCREENY);

  // TEST MAP - Johnny 13/03
  /*
  shape(usa, 300, 100);
  texas.disableStyle();
  fill(#74DBE5);
  shape(texas, 300, 100);
  */
  //barCharts.dateOnly();
  //pieCharts.lateOnly();
}

void Dates(int dateIndex) {
  /* request the selected item based on index n */
  println(dateIndex);
}
