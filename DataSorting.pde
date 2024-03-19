class DataSorting
{
  Table data; // Implemented DataSorting class Julius Jogela 14/03/24
  int numberOfFlights;
  void setup()
  {
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
  }
}
