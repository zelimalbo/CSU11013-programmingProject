/*
  Data Sorting class implemented by Julius, Jude and Johnny
*/
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
  
  // Johnny editted DataSorting on 06/04 to fix previous issues with data sorting class
  ArrayList<String> filteredOrigins;            
  ArrayList<String> filteredDestinations;

  ArrayList<String> filteredOriginStates;
  ArrayList<String> filteredDestinationStates;
  
  ArrayList<String> filteredDates;
  ArrayList<String> filteredCarriers;

  void setup(Table data)  //Written here by Julius 14/03 9:40
  {
    this.data = data;
    //Updated to make arrayLists by Julius 20/03 9:10
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
      } else {
        stateFrequencies.put(state, 1);
        print(state + ", ");
      }
    }
    for (String state : fullDestinationStateList) {
      if (stateFrequencies.containsKey(state)) {
        stateFrequencies.put(state, stateFrequencies.get(state) + 1);
      } else {
        stateFrequencies.put(state, 1);
        print(state + ", ");
      }
    }
    return stateFrequencies;
  }
  // Overloaded getStateFrequencies method to allow for getting frequencies of both origins and destinations or one of them.
  Map getStateFrequencies(ArrayList<String> fullList) {
    Map<String, Integer> frequencies = new HashMap<>();
    for (String state : fullList) {
      if (frequencies.containsKey(state)) {
        frequencies.put(state, frequencies.get(state) + 1);
      } else {
        frequencies.put(state, 1);
        print(state + ", ");
      }
    }
    return frequencies;
  }

  // functions for getting the ArrayLists implemented by jude
  void filteredFlightsByOrigin(String selectedOrigin) {
    filteredOrigins = new ArrayList();
    filteredDestinations = new ArrayList();
    filteredOriginStates = new ArrayList();
    filteredDestinationStates = new ArrayList();
    filteredDates = new ArrayList();
    filteredCarriers = new ArrayList();
    
    for (int i = 0; i < fullOriginList.size(); i++) {
      if (fullOriginList.get(i).equals(selectedOrigin))
      {
        filteredOrigins.add(selectedOrigin); //Implemented By Julius 28/03/24
        String date = fullDateList.get(i);
        filteredDates.add(date);
        String carrier= fullCarrierList.get(i);
        filteredCarriers.add(carrier);
        String OriginState = fullOriginStateList.get(i);
        filteredOriginStates.add(OriginState);
        String dest = fullDestinationList.get(i);
        filteredDestinations.add(dest);
        String destinationState = fullDestinationStateList.get(i);
        filteredDestinationStates.add(destinationState);
      }
    }
  }

  void filteredFlightsByDestination(String selectedDestination) {
    for (int i = 0; i < fullDestinationList.size(); i++) {
      if (fullDestinationList.get(i).equals(selectedDestination))
      {
        filteredDestinations.add(selectedDestination); //Implemented By Julius 28/03/24
        String date = fullDateList.get(i);
        filteredDates.add(date);
        String carrier= fullCarrierList.get(i);
        filteredCarriers.add(carrier);
        String originState = fullOriginStateList.get(i);
        filteredOriginStates.add(originState);
        String origin = fullDestinationList.get(i);
        filteredOrigins.add(origin);
        String destinationState = fullDestinationStateList.get(i);
        filteredDestinationStates.add(destinationState);
      }
    }
  }
  void filteredFlightsByOriginAndDestination(String selectedOrigin, String selectedDestination) {
    for (int i = 0; i < fullDestinationList.size(); i++) {
      if (fullDestinationList.get(i).equals(selectedDestination))
      {
        if (fullOriginList.get(i).equals(selectedOrigin))
        {
          filteredOrigins.add(selectedOrigin);               //Implemented By Julius 28/03/24
          filteredDestinations.add(selectedDestination);
          String date = fullDateList.get(i);
          filteredDates.add(date);
          String carrier= fullCarrierList.get(i);
          filteredCarriers.add(carrier);
          String OriginState = fullOriginStateList.get(i);
          filteredOriginStates.add(OriginState);
          String dest = fullDestinationList.get(i);
          filteredDestinations.add(dest);
          String destinationState = fullDestinationStateList.get(i);
          filteredDestinationStates.add(destinationState);
        }
      }
    }
  }
  void filteredFlightsByDate(int startDate, int endDate) //implemented by julius 03/04/24
  {
    String startDateString = dateList.get(startDate);
    int startDateIndex =0;
    for (int i = 0; i<fullDateList.size(); i++)
    {
      String testDate = fullDateList.get(i);
      if (testDate.equals(startDateString))
      {
        startDateIndex = i;
        i = fullDateList.size();
      }
    }
    String endDateString = dateList.get(endDate);
    int endDateIndex=0;
    for (int i = fullDateList.size(); i>0; i--)
    {
      String testDate = fullDateList.get(i-1);
      if (testDate.equals(endDateString))
      {
        endDateIndex = i;
        i = 0;
      }
    }
    filteredOrigins.addAll(fullOriginList.subList(startDateIndex, endDateIndex));
    filteredDates.addAll(fullDateList.subList(startDateIndex, endDateIndex));
    filteredCarriers.addAll(fullCarrierList.subList(startDateIndex, endDateIndex));
    filteredOriginStates.addAll(fullOriginStateList.subList(startDateIndex, endDateIndex));
    filteredDestinations.addAll(fullDestinationList.subList(startDateIndex, endDateIndex));
    filteredDestinationStates.addAll(fullDestinationStateList.subList(startDateIndex, endDateIndex));
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
      } else {
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
  
  Map getFrequencies(ArrayList<String> fullList) {
    Map <String, Integer> frequencies = new HashMap<>();
    for (String dataPoint : fullList) {
      if (frequencies.containsKey(dataPoint)) {
        frequencies.put(dataPoint, frequencies.get(dataPoint) + 1);
      } else {
        frequencies.put(dataPoint, 1);
      }
    }
    return frequencies;
  }
  
  /*
    Johnny implemented getFlightsByAirline method
    on 01/04
    This method returns a map containing the total flights per airline
  */
  Map getFlightsByCarrier(ArrayList<String> fullCarrierList) {
    Map<String, Integer> flightsByCarrier = new HashMap<>();
    for (String carrier : fullCarrierList) {
      if (flightsByCarrier.containsKey(carrier)) {
        flightsByCarrier.put(carrier, flightsByCarrier.get(carrier) + 1);
      } else {
        flightsByCarrier.put(carrier, 1);
      }
    }
    return flightsByCarrier;
  }
  
  /*
    Johnny implemented sortMap method
    on 06/04
    This method takes in a Map<String, Integer> and returns the map
    sorted in desending order.
    This map will be used to show the data points with the highest frequency
    on the bar chart (e.g. Top 10 Destinations from JFK)
  */
  Map sortMap(Map<String, Integer> unsortedMap) {
    Map<String, Integer> sortedMap = new LinkedHashMap();
    List<Map.Entry<String, Integer>> list = new ArrayList<>(unsortedMap.entrySet());
    list.sort(Map.Entry.comparingByValue(Collections.reverseOrder()));
    for (Map.Entry<String, Integer> entry : list) {
      sortedMap.put(entry.getKey(), entry.getValue());
    }
    return sortedMap;
  }
}
