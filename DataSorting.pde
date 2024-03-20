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
  
  ArrayList<String> fullOriginList = new ArrayList<String>();
  ArrayList<String> fullOriginStateList = new ArrayList<String>();
  ArrayList<String> fullDateList = new ArrayList<String>();
  ArrayList<String> fullCarrierList = new ArrayList<String>();
  ArrayList<String> fullDestinationList = new ArrayList<String>();
  ArrayList<String> fullDestinationStateList = new ArrayList<String>();
  
  void setup()  //Written here by Julius 14/03 9:40
  {
    
    data = loadTable("flights2k.csv", "header");  //Updated to make arrayLists by Julius 20/03 9:10
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
      
      String destination_state = row.getString("DEST_CITY_NAME");
      destinationStateList = addToArrayList(destinationStateList, destination_state);
      fullDestinationStateList.add(destination_state);
      numberOfFlights++;
       
    }
  }
  ArrayList alphabeticalSorting(ArrayList DataArrayList)
  {
    return;
  }
  boolean checkIfFirstInstanceOfString(String addedDataPoint, ArrayList DataArrayList)
  {
   return  ;
  }
  ArrayList addToArrayList(ArrayList List, String dataPointToBeAdded) //Written by Julius 20/03 9:10
  {
    boolean firstInstance = checkIfFirstInstanceOfString(dataPointToBeAdded, List);
    if(!firstInstance)
    {
      return List;
    }
    List.add(dataPointToBeAdded);
    return List;
  }
  ArrayList appendOriginAirportWithState(ArrayList airport, ArrayList state)
  {
    
  }
}
