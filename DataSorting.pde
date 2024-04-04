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

  ArrayList<String> filteredOrigins = new ArrayList<>();
  ArrayList<String> filteredDates = new ArrayList<>();
  ArrayList<String> filteredCarrier = new ArrayList<>();
  ArrayList<String> filteredOriginCityName = new ArrayList<>();
  ArrayList<String> filteredDestination = new ArrayList<>();
  ArrayList<String> filteredDestinationCityName = new ArrayList<>();

  ArrayList<String> filteredOriginsforDestination = new ArrayList<>();
  ArrayList<String> filteredDatesforDestination = new ArrayList<>();
  ArrayList<String> filteredCarrierforDestination = new ArrayList<>();
  ArrayList<String> filteredOriginCityNameforDestination = new ArrayList<>();
  ArrayList<String> filteredDestinationforDestination = new ArrayList<>();
  ArrayList<String> filteredDestinationCityNameforDestination = new ArrayList<>();

  ArrayList<String> filteredOriginforOriginAndDestination = new ArrayList<>();
  ArrayList<String> filteredDatesforOriginAndDestination = new ArrayList<>();
  ArrayList<String> filteredCarrierforOriginAndDestination = new ArrayList<>();
  ArrayList<String> filteredOriginCityNameforOriginAndDestination = new ArrayList<>();
  ArrayList<String> filteredDestinationforOriginAndDestination = new ArrayList<>();
  ArrayList<String> filteredDestinationCityNameforOriginAndDestination = new ArrayList<>();

  ArrayList<String> filteredOriginsForDateRangeArrayList = new ArrayList<>();
  ArrayList<String> filteredDatesForDateRangeArrayList = new ArrayList<>();
  ArrayList<String> filteredCarrierForDateRangeArrayList = new ArrayList<>();
  ArrayList<String> filteredOriginCityNameForDateRangeArrayList = new ArrayList<>();
  ArrayList<String> filteredDestinationForDateRangeArrayList = new ArrayList<>();
  ArrayList<String> filteredDestinationCityNameForDateRangeArrayList = new ArrayList<>();

  public DataSorting() {
  }

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

  // functions for getting the ArrayLists implemented by jude
  void filteredFlightsByOrigin(String selectedOrigin) {
    for (int i = 0; i < fullOriginList.size(); i++) {
      if (fullOriginList.get(i).equals(selectedOrigin))
      {
        filteredOrigins.add(selectedOrigin); //Implemented By Julius 28/03/24
        String date = fullDateList.get(i);
        filteredDates.add(date);
        String carrier= fullCarrierList.get(i);
        filteredCarrier.add(carrier);
        String OriginState = fullOriginStateList.get(i);
        filteredOriginCityName.add(OriginState);
        String dest = fullDestinationList.get(i);
        filteredDestination.add(dest);
        String destinationCityName = fullDestinationStateList.get(i);
        filteredDestinationCityName.add(destinationCityName);
      }
    }
  }

  void filteredFlightsByDestination(String selectedDestination) {
    for (int i = 0; i < fullDestinationList.size(); i++) {
      if (fullDestinationList.get(i).equals(selectedDestination))
      {
        filteredDestinationforDestination.add(selectedDestination); //Implemented By Julius 28/03/24
        String date = fullDateList.get(i);
        filteredDatesforDestination.add(date);
        String carrier= fullCarrierList.get(i);
        filteredCarrierforDestination.add(carrier);
        String OriginState = fullOriginStateList.get(i);
        filteredOriginCityNameforDestination.add(OriginState);
        String dest = fullDestinationList.get(i);
        filteredDestinationforDestination.add(dest);
        String destinationCityName = fullDestinationStateList.get(i);
        filteredDestinationCityNameforDestination.add(destinationCityName);
      }
    }
  }
  void filteredFlightsByOriginAndDestination(String selectedOrigin, String selectedDestination) {
    for (int i = 0; i < fullDestinationList.size(); i++) {
      if (fullDestinationList.get(i).equals(selectedDestination))
      {
        if (fullOriginList.get(i).equals(selectedOrigin))
        {
          filteredOriginforOriginAndDestination.add(selectedOrigin);               //Implemented By Julius 28/03/24
          filteredDestinationforOriginAndDestination.add(selectedDestination);
          String date = fullDateList.get(i);
          filteredDatesforOriginAndDestination.add(date);
          String carrier= fullCarrierList.get(i);
          filteredCarrierforOriginAndDestination.add(carrier);
          String OriginState = fullOriginStateList.get(i);
          filteredOriginCityNameforOriginAndDestination.add(OriginState);
          String dest = fullDestinationList.get(i);
          filteredDestinationforOriginAndDestination.add(dest);
          String destinationCityName = fullDestinationStateList.get(i);
          filteredDestinationCityNameforOriginAndDestination.add(destinationCityName);
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
    filteredOriginsForDateRangeArrayList.addAll(fullOriginList.subList(startDateIndex, endDateIndex));
    filteredDatesForDateRangeArrayList.addAll(fullDateList.subList(startDateIndex, endDateIndex));
    filteredCarrierForDateRangeArrayList.addAll(fullCarrierList.subList(startDateIndex, endDateIndex));
    filteredOriginCityNameForDateRangeArrayList.addAll(fullOriginStateList.subList(startDateIndex, endDateIndex));
    filteredDestinationForDateRangeArrayList.addAll(fullDestinationList.subList(startDateIndex, endDateIndex));
    filteredDestinationCityNameForDateRangeArrayList.addAll(fullDestinationStateList.subList(startDateIndex, endDateIndex));
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
}
