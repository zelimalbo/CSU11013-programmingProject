class DataSorting
{
  Table data;
  int numberOfFlights;
  ArrayList<String> originList = new ArrayList<String>();          //ONLY ONE INSTANCE OF EACH IN THESE STRINGS USED FOR DROP DOWN MENUS
  ArrayList<String> originStateList = new ArrayList<String>();
  ArrayList<String> dateList = new ArrayList<String>();
  ArrayList<String> carrierList = new ArrayList<String>();
  ArrayList<String> destinationList = new ArrayList<String>();
  ArrayList<String> destinationStateList = new ArrayList<String>();

  ArrayList<Integer> scheduledDepartureTimeList = new ArrayList<>();
  ArrayList<Integer> actualDepartureTimeList = new ArrayList<>();

  ArrayList<String> fullOriginList = new ArrayList<String>();
  ArrayList<String> fullOriginStateList = new ArrayList<String>();
  ArrayList<String> fullDateList = new ArrayList<String>();
  ArrayList<String> fullCarrierList = new ArrayList<String>();
  ArrayList<String> fullDestinationList = new ArrayList<String>();
  ArrayList<String> fullDestinationStateList = new ArrayList<String>();

  void setup()  //Written here by Julius 14/03 9:40
  {

    data = loadTable("flights_full.csv", "header");  //Updated to make arrayLists by Julius 20/03 9:10
    for (TableRow row : data.rows()) {
      String origin = row.getString("ORIGIN");
      originList = addToArrayList(originList, origin);
      fullOriginList.add(origin);

      String date = row.getString("FL_DATE");
      dateList = addToArrayList(dateList, date);
      fullDateList.add(date);

      String carrier = row.getString("MKT_CARRIER");
      carrierList = addToArrayList(carrierList, carrier);
      fullCarrierList.add(carrier);

      String carrier_flight_number = row.getString("MKT_CARRIER_FL_NUM");
      String origin_city = row.getString("ORIGIN_CITY_NAME");

      String origin_state = row.getString("ORIGIN_STATE_ABR");
      originStateList = addToArrayList(originStateList, origin_state);
      fullOriginStateList.add(origin_state);

      String destination = row.getString("DEST");
      destinationList = addToArrayList(destinationList, destination);
      fullDestinationList.add(destination);

      String destination_state = row.getString("DEST_STATE_ABR");
      destinationStateList = addToArrayList(destinationStateList, destination_state);
      fullDestinationStateList.add(destination_state);
      numberOfFlights++;

      int scheduledDepartureTimeData = row.getInt("CRS_DEP_TIME"); //Implemented by Julius 20/03/24
      scheduledDepartureTimeList.add(scheduledDepartureTimeData);

      int actualDepartureTimeData = row.getInt("DEP_TIME");
      actualDepartureTimeList.add(actualDepartureTimeData);
    }
    ArrayList<Boolean> isLate = isLateFlight(scheduledDepartureTimeList, actualDepartureTimeList);
    ArrayList<Boolean> isOnTimeOrEarly = isOnTimeOrEarlyFlight(scheduledDepartureTimeList, actualDepartureTimeList);
  }

  ArrayList<String> alphabeticalSorting(ArrayList<String> list) {
    Collections.sort(list);
    return list;
  }

  boolean checkIfFirstInstanceOfDataPoint(String addedDataPoint, ArrayList<String> dataArrayList) {
    for (int i = 0; i < dataArrayList.size(); i++) {
      if (addedDataPoint.equals(dataArrayList.get(i))) {
        return false;
      }
    }
    return true;
  }

  ArrayList appendAirportWithState(ArrayList airport, ArrayList state)
  {
    ArrayList<String> result = new ArrayList<>();
    for (int i = 0; i < airport.size(); i++) {
      String airportWithState = airport.get(i) + ", " + state.get(i);
      result.add(airportWithState);
    }

    return result;
  }
  ArrayList addToArrayList(ArrayList<String> list, String dataPointToBeAdded) //Implemented by Julius 20/03/24
  {
    boolean firstInstance = checkIfFirstInstanceOfDataPoint(dataPointToBeAdded, list);
    if (!firstInstance)
    {
      return list;
    } else
    {
      list.add(dataPointToBeAdded);
      return list;
    }
  }
  ArrayList isLateFlight(ArrayList<Integer> scheduledDepartureTime, ArrayList<Integer> actualDepartureTime) //Implemented by Julius 20/03/24
  {
    ArrayList<Boolean> isLate = new ArrayList<>();
    for (int index = 0; index< scheduledDepartureTime.size(); index++)
    {
      if (scheduledDepartureTime.get(index) < actualDepartureTime.get(index))
      {
        isLate.add(true);
      } else
      {
        isLate.add(false);
      }
    }
    return isLate;
  }
  ArrayList isOnTimeOrEarlyFlight(ArrayList<Integer> scheduledDepartureTime, ArrayList<Integer> actualDepartureTime) //Implemented by Julius 20/03/24
  {
    ArrayList<Boolean> isOnTimeOrEarly = new ArrayList<>();
    for (int index = 0; index< scheduledDepartureTime.size(); index++)
    {
      if (scheduledDepartureTime.get(index) > actualDepartureTime.get(index))
      {
        isOnTimeOrEarly.add(true);
      } else
      {
        isOnTimeOrEarly.add(false);
      }
    }
    return isOnTimeOrEarly;
  }
  void removeTimeAndYear(ArrayList<String> dates) {
        for (int i = 0; i < dates.size(); i++) {
            String date = dates.get(i);
            String[] parts = date.split(" ");
            String dateWithoutTimeAndYear = parts[0];
            dates.set(i, dateWithoutTimeAndYear);
        }
    }
    
  /* 
    Johnny Implemented getStateFrequencies method
    on 24/03.
    This method returns a map containing the total number of flights
    including departures and arrivals in each US state.
  */
  Map getStateFrequencies(ArrayList<String> fullOriginStateList, ArrayList<String> fullDestinationStateList) {
    Map<String, Integer> stateFrequencies = new HashMap<>();
    for (String state : fullOriginStateList) {
      if (stateFrequencies.containsKey(state)) {
        stateFrequencies.put(state, stateFrequencies.get(state) + 1);
      }
      else {
        stateFrequencies.put(state, 1);
        print(state + ", ");
      }
    }
    for (String state : fullDestinationStateList) {
      if (stateFrequencies.containsKey(state)) {
        stateFrequencies.put(state, stateFrequencies.get(state) + 1);
      }
      else {
        stateFrequencies.put(state, 1);
        print(state + ", ");
      }
    }
 
    return stateFrequencies;
  }
  
  /*
    Johnny implemented getDateFrequencies method
    on 26/03
    This method returns a map containing the total number of flights on each date
  */
  Map getDateFrequencies(ArrayList<String> fullDateList) {
    removeTimeAndYear(fullDateList);
    Map<String, Integer> dateFrequencies = new HashMap<>();
    for (String date : fullDateList) {
      if (dateFrequencies.containsKey(date)) {
        dateFrequencies.put(date, dateFrequencies.get(date) + 1);
      }
      else {
        dateFrequencies.put(date, 1);
      }
    }
    /* //--- For debugging ---
    removeTimeAndYear(this.dateList);
    int totalFlights = 0;
    for (String date : this.dateList) {
      print(date + ": " + dateFrequencies.get(date) + "; ");
      totalFlights += dateFrequencies.get(date);
    }
    print("Total Flights: " + totalFlights + ". ");
    */
    return dateFrequencies;
  }
}
