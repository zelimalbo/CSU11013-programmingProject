import controlP5.*; //<>//
import java.util.*;
import java.util.Collections;

Screen currentScreen, tableScreen, heatMapScreen, lineGraphScreen, pieChartScreen, barChartScreen;

PShape usa;
HeatMap heatMap;

PFont stdFont;

Table totalData;

int variableName = 5;

NavBar navBar;

DataTable dataTable;
LineGraph lineGraph;
pieCharts PieCharts;
barCharts barChart;

DataSorting data = new DataSorting();
Map<String, Integer> barChartAdjuster = new HashMap<String, Integer>();

void setup() {
  totalData = loadTable("flights_full.csv", "header");
  stdFont = loadFont("Calibri-14.vlw");
  size(1400, 800);
  //DataSorting data = new DataSorting();   // Implemented DataSorting class Julius Jogela 14/03/24
  data.setup(totalData);
  println("There are " + data.numberOfFlights + " flights in the dataset");

  //Added NavBar Eoghan Gloster 14/2/23
  //Cleaned up Main by moving back into NavBar 20/2/23
  navBar = new NavBar();
  navBar.allLists = new ControlP5(this);
  //navBar.originList = new ControlP5(this);      Can get rid of, was all redundant
  //navBar.destinationList = new ControlP5(this);
  //navBar.searchButton = new ControlP5(this);
  //navBar.miscLists = new ControlP5(this);
  navBar.setup();
  //Added NavBar Eoghan Gloster 14/2/23^^

  //pieCharts = new pieCharts();

  // Johnny implemented screens
  // --- HeatMap Screen ---
  usa = loadShape("us.svg");
  Map<String, Integer> frequencies = data.getStateFrequencies(data.fullOriginStateList, data.fullDestinationStateList);
  heatMap = new HeatMap(usa, frequencies, 300, 100);
  heatMapScreen = new Screen(heatMap);

  // --- Data Table Screen ---
  dataTable = new DataTable(totalData, new ArrayList<>(Arrays.asList(1, 2, 4, 5, 8, 9, 16, 17, 18)));
  tableScreen = new Screen(dataTable);

  // --- Line Graph Screen ---
  Map<String, Integer> dateFrequencies = data.getDateFrequencies(data.fullDateList);
  lineGraph = new LineGraph(NAV_BAR_WIDTH + (SCREEN_WIDTH-600)/2, (SCREENY-600)/2, 600, 600, dateFrequencies);
  lineGraphScreen = new Screen(lineGraph);

  // --- Pie Chart Screen ---
  PieCharts = new pieCharts(700, 300, 300, dateFrequencies);
  pieChartScreen = new Screen(PieCharts);

  // --- Bar Chart Screen ---
  // Initialize dimensions and position for the chart
  float chartX = 350;
  float chartY = 300;
  float chartWidth = 1000;
  float chartHeight = 300;

  Map<String, Integer> barChartAdjuster = data.getStateFrequencies(data.fullOriginStateList, data.fullDestinationStateList);
  barCharts barChart = new barCharts(this, chartX, chartY, chartWidth, chartHeight, barChartAdjuster);
  barChartScreen = new Screen(barChart);
  
  // --- Current Screen ---
  //   ***FOR TESTING CHANGE CURRENT SCREEN TO SCREEN YOU WISH TO TEST***
  currentScreen = lineGraphScreen;
  //currentScreen = barChartScreen;
}

void draw() {
  background(245);
  noStroke();
  fill(200);
  rect(0, 0, 300, SCREENY);

  currentScreen.draw();

  changeScreen(navBar.getPickScreensInt());


  navBar.disappearingDates(navBar.getDatesInt());

  //destinationFilterOnly();
}

void mouseMoved() {
  /*
    Johnny added mouse moved method on 03/04
   Currently being used for highlighting buttons
   */
  if (currentScreen.isTable) {
    ArrayList buttons = currentScreen.dataTable.controls;
    for (int i = 0; i < buttons.size()-1; i++) {
      Widget button = (Widget) buttons.get(i);
      int event = button.getEvent(mouseX, mouseY);
      if (event != EVENT_NULL) {
        button.mouseOver();
      } else {
        button.mouseNotOver();
      }
    }
  }
}

void mousePressed() {
  //destinationFilterOnly();
  //destinationAndOriginFilterOnly();
  filterByOrigin();
  /*
    Johnny added mouse press method on 20/03
   Currently being used for buttons to go backward and forward in the table
   */
  if (currentScreen.isTable) {
    currentScreen.getEvent(mouseX, mouseY);
  }
}

void keyPressed() {
  /*
    Johnny added key press method on 20/03
   Currently being used for the table to search for pages
   */
  TextWidget input = (TextWidget) currentScreen.dataTable.controls.get(2);
  if (currentScreen.isTable && currentScreen.dataTable.event == 2) {
    try {
      int intKey = Integer.parseInt(String.valueOf(key));
      if (intKey <= 9 && intKey >= 0) {
        if (input.label != "Find Page") {
          input.append(key);
        } else {
          if (intKey != 0) {
            input.label = String.valueOf(key);
          }
        }
      }
    }
    catch(NumberFormatException e) {
    }
    try {
      int intInput = Integer.parseInt(input.label);
      if (key == BACKSPACE && intInput >= 1) {
        intInput /= 10;
        if (intInput == 0) {
          input.label = "Find Page";
        } else {
          input.label = String.valueOf(intInput);
        }
      }
      if (key == ENTER && intInput >= 1 && intInput <= currentScreen.dataTable.totalPages) {
        currentScreen.dataTable.currentPage = intInput;
      }
    }
    catch (NumberFormatException e) {
    }
  }
}


void changeScreen(int screenSelection) {
  if (navBar.buttonState == true) {
    println("test button");
    currentScreen = heatMapScreen;
  }
  if (screenSelection == 1) {
    currentScreen = tableScreen;
  }
  if (screenSelection == 2) {
    currentScreen = lineGraphScreen;
  }
  if (screenSelection == 3) {
    currentScreen = pieChartScreen;
  }

  if (screenSelection == 4) {
    currentScreen = barChartScreen;
  }
}

void filterByOrigin() {
  String filterBy = navBar.getOriginString(); // Get the chosen origin from the drop down menu
  if (filterBy != "--All--") {
    float chartX = 350;
    float chartY = 300;
    float chartWidth = 1000;
    float chartHeight = 300;
    println(filterBy);                                   

    data.filteredFlightsByOrigin(filterBy); // Filter the destinations using the given origin to get all destination airports from that origin
    Map <String, Integer> filteredFrequencies = data.getFrequencies(data.filteredDestinations);  // frequencies of destination airports
    filteredFrequencies = data.sortMap(filteredFrequencies);
    barChartScreen.barChart = new barCharts(this, chartX, chartY, chartWidth, chartHeight, filteredFrequencies); // Display results on bar chart
  }
}

//Added By Eoghan Gloster 4/4/24
/*
public void destinationFilterOnly() {      //does soemthing for the moment
  float chartX = 350;
  float chartY = 300;
  float chartWidth = 1000;
  float chartHeight = 300;

  String filteredDest = navBar.getDestinationString();        //i get the user destination
  println(filteredDest);                                      //i get it and print

  data.filteredFlightsByDestination(filteredDest);            //i filter the data by the destination requested
  barChartAdjuster = data.getDateFrequencies(data.filteredOriginCityNameforDestination);  //i set the hashmap to the date frequences for the requested destination
  barChartScreen.barChart = new barCharts(this, chartX, chartY, chartWidth, chartHeight, barChartAdjuster);
}

public void destinationAndOriginFilterOnly() {
  float chartX = 350;
  float chartY = 300;
  float chartWidth = 1000;
  float chartHeight = 300;
  
  String filteredOrigin= navBar.getOriginString();
  String filteredDest = navBar.getDestinationString();        //i get the user destination
  println(filteredDest);                                      //i get it and print

  data.filteredFlightsByOriginAndDestination("JFK","LAX");            //i filter the data by the destination requested
  
  println("-------------------"+data.filteredOriginCityNameforOriginAndDestination.get(0));
  barChartAdjuster = data.getStateFrequencies(data.filteredOriginCityNameforOriginAndDestination,data.filteredDestinationCityNameforOriginAndDestination);  //i set the hashmap to the date frequences for the requested destination
  barChartScreen.barChart = new barCharts(this, chartX, chartY, chartWidth, chartHeight, barChartAdjuster);
}
*/
