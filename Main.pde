import controlP5.*;
import java.util.*;
import java.util.Collections;

Screen currentScreen;

PFont stdFont;

Table totalData;

barCharts barCharts;
pieCharts pieCharts;

NavBar NavBar;
NavBar tempNavBar;
int variableName = 5;

DataTable dataTable;

void setup() {
  totalData = loadTable("flights2k.csv", "header");
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
  tempNavBar.setup();
  //Added NavBar Eoghan Gloster 14/2/23^^

  barCharts = new barCharts();
  pieCharts = new pieCharts();
  barCharts.buttons();
  
  dataTable = new DataTable(totalData, new ArrayList<>(Arrays.asList(1,2,4,5,8,9,16,17,18)));
  
  // Currently the data table is being used as the default main screen
  currentScreen = new Screen(dataTable);
}

void draw() {
  background(245);
  noStroke();
  //barCharts.dateOnly();
  barCharts.originOnly();
  barCharts.draw();
  //pieCharts.lateOnly();
  //pieCharts.drawPieLegend();
  fill(245);
  rect(0, 0, 320, SCREENY);
  fill(200);
  rect(0, 0, 300, SCREENY);
  
  currentScreen.draw();
  //barCharts.dateOnly();
  //pieCharts.lateOnly();
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
      if (key == ENTER && intInput >= 1 && intInput <= input.maxlen) {
        currentScreen.dataTable.currentPage = intInput;
      }
    }
    catch (NumberFormatException e) {
    }
  }
}