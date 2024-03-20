import controlP5.*;
import java.util.*;

NavBar tempNavBar;

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

//barCharts barCharts;
//pieCharts pieCharts;

void setup() {
  stdFont = loadFont("Calibri-14.vlw");
  size(1400, 800);
  DataSorting data = new DataSorting();   // Implemented DataSorting class Julius Jogela 14/03/24
  data.setup();
  println("There are " + data.numberOfFlights + " flights in the dataset");
  //Added NavBar Eoghan Gloster 14/2/23
  NavBar tempNavBar = new NavBar();
  tempNavBar.dateList = new ControlP5(this);
  tempNavBar.originList = new ControlP5(this);
  tempNavBar.destinationList = new ControlP5(this);
  
  tempNavBar.dateList.addScrollableList("Dates")
    .setPosition(50, 50)
    .setSize(100, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(tempNavBar.Dates)
    .close()
    ;


  tempNavBar.originList.addScrollableList("Origin")
    .setPosition(50, 200)
    .setSize(100, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(tempNavBar.Origin)
    .close()
    ;

  tempNavBar.destinationList.addScrollableList("Destination")
    .setPosition(50, 350)
    .setSize(100, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(tempNavBar.Destination)
    .close()
    ;
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
  
  /*
  shape(usa, 300, 100);
  texas.disableStyle();
  fill(#74DBE5);
  shape(texas, 300, 100);
  */
  //barCharts.dateOnly();
  //pieCharts.lateOnly();
}
