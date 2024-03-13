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
}

void draw() {
  background(245);
  noStroke();
  fill(200);
  rect(0, 0, 300, SCREENY);
}
