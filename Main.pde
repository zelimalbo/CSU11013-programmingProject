Table data;
final int SCREENX = 1400;
final int SCREENY = 800;
final int NAV_BAR_WIDTH = 300;
final int GRAPH_HEIGHT = 600;
final int GRAPH_WIDTH = 600;
int numberOfFlights;
// Temporary test Data for testing histogram
int[] testData = new int[]{12, 11, 111, 222, 160, 40, 25, 84, 94, 300, 7, 89};

// Shapes for map - Johnny Hancu 13/03
PShape usa;
PShape texas; // Test coloring an individual state

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
  
  usa = loadShape("us.svg");
  texas = usa.getChild("TX");
}

void draw() {
  background(245);
  noStroke();
  fill(200);
  rect(0, 0, NAV_BAR_WIDTH, SCREENY);
  
  // TEST HISTOGRAM
  /*
  Histogram hist = new Histogram(testData, 
    ((SCREENX - NAV_BAR_WIDTH - GRAPH_WIDTH) / 2) + NAV_BAR_WIDTH,
    (SCREENY - GRAPH_WIDTH) / 2);
  hist.draw();
  */
  
  // TEST MAP
  shape(usa, 300, 100);
  texas.disableStyle();
  fill(#74DBE5);
  shape(texas, 300, 100);
}
