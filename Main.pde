import controlP5.*;
import java.util.*;
import java.util.Collections;

Screen currentScreen, tableScreen, heatMapScreen, lineGraphScreen;

PShape usa;
HeatMap heatMap;

PFont stdFont;

Table totalData;

barCharts barCharts;
pieCharts pieCharts;

NavBar NavBar;
NavBar tempNavBar;
int variableName = 5;


DataTable dataTable;

LineGraph lineGraph;

void setup() {
  totalData = loadTable("flights2k.csv", "header");          //Already loaded in DataSorting. Could be moved around
  stdFont = loadFont("Calibri-14.vlw");
  size(1400, 800);
  DataSorting data = new DataSorting();   // Implemented DataSorting class Julius Jogela 14/03/24
  data.setup();
  println("There are " + data.numberOfFlights + " flights in the dataset");

  //Added NavBar Eoghan Gloster 14/2/23
  //Cleaned up Main by moving back into NavBar 20/2/23
  tempNavBar = new NavBar();
  tempNavBar.dateList = new ControlP5(this);
  tempNavBar.originList = new ControlP5(this);
  tempNavBar.destinationList = new ControlP5(this);
  tempNavBar.searchButton = new ControlP5(this);
  tempNavBar.miscLists = new ControlP5(this);
  tempNavBar.setup();
  //Added NavBar Eoghan Gloster 14/2/23^^

  barCharts = new barCharts();
  barCharts.setup();
  pieCharts = new pieCharts();
  
  // --- HeatMap Screen ---
  usa = loadShape("us.svg");
  Map<String, Integer> frequencies = data.getStateFrequencies(data.fullOriginStateList, data.fullDestinationStateList);
  heatMap = new HeatMap(usa, frequencies, 300, 100);
  heatMapScreen = new Screen(heatMap);
  
  // --- Data Table Screen ---
  dataTable = new DataTable(totalData, new ArrayList<>(Arrays.asList(1,2,4,5,8,9,16,17,18)));
  tableScreen = new Screen(dataTable);
  
  // --- Line Graph Screen ---
  Map<String, Integer> dateFrequencies = data.getDateFrequencies(data.fullDateList);
  lineGraph = new LineGraph(NAV_BAR_WIDTH + (SCREEN_WIDTH-600)/2, (SCREENY-600)/2, 600, 600, dateFrequencies);
  lineGraphScreen = new Screen(lineGraph);
  
  // --- Current Screen ---
  //   ***FOR TESTING CHANGE CURRENT SCREEN TO SCREEN YOU WISH TO TEST***
   currentScreen = lineGraphScreen;
}

void draw() {
  background(245);
  noStroke();
  //heatMap.draw();
  //barCharts.dateOnly();
  //barCharts.originOnly();
  //barCharts.draw();
  //pieCharts.lateOnly();
  //pieCharts.drawPieLegend();
  //fill(245);
  //rect(0, 0, NAV_BAR_WIDTH, SCREENY);
  fill(200);
  rect(0, 0, 300, SCREENY);
  
  currentScreen.draw();
  //barCharts.dateOnly();
  //pieCharts.lateOnly();
  println(tempNavBar.getPickScreensInt());
  changeScreen(tempNavBar.getPickScreensInt());
  disappearingDates(tempNavBar.getDatesInt());
}


void mousePressed() {
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
        }
        else {
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
        }
        else { 
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

void disappearingDates(int dateSelection) {                     //ADDED BY EOGHAN VERY IMPORTANT
  if (dateSelection==0) {
    tempNavBar.dateList.getController("Too").setVisible(true);
    tempNavBar.dateList.getController("From").setVisible(true);
  } else {
    tempNavBar.dateList.getController("Too").setVisible(false);
    tempNavBar.dateList.getController("From").setVisible(false);
  }
}

void changeScreen(int screenSelection){
  if(screenSelection == 0){
    currentScreen = heatMapScreen;
  }
  if(screenSelection == 1){
    currentScreen = tableScreen;
  }
  if(screenSelection == 2){
    currentScreen = lineGraphScreen;
  }
   
}
