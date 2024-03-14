import controlP5.*;
import java.util.*;



Table data;
final int SCREENX = 1400;
final int SCREENY = 800;
int numberOfFlights;

void setup() {
  size(1400, 800);
  data = loadTable("flights2k.csv", "header");
  for (TableRow row : data.rows()) {
    String origin = row.getString("ORIGIN");
    String date = row.getString("FL_DATE");
    String carrier = row.getString("MKT_CARRIER");
    String carrier_flight_number = row.getString("MKT_CARRIER_FL_NUM");
    String origin_city = row.getString("ORIGIN_CITY_NAME");
    String origin_state = row.getString("ORIGIN_STATE_ABR");
    String destination_city = row.getString("DEST");
    String destination_state = row.getString("DEST_CITY_NAME");
    numberOfFlights++;
  }
  println("There are " + numberOfFlights + " flights in the dataset");
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
    ;


  tempNavBar.originList.addScrollableList("Origin")
    .setPosition(50, 200)
    .setSize(100, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(tempNavBar.Origin)
    ;

  tempNavBar.destinationList.addScrollableList("Destination")
    .setPosition(50, 350)
    .setSize(100, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(tempNavBar.Destination)
    ;
}

void draw() {
  background(245);
  noStroke();
  fill(200);
  rect(0, 0, 300, SCREENY);
  // TEST HISTOGRAM
  Histogram hist = new Histogram();
  hist.draw();
}
