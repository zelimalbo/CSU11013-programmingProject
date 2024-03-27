import controlP5.*;
import java.util.*;
class NavBar {
  //Added A functional yet early navBar with three dropdowns. Eoghan Gloster. 13/3/23
  //The Data below is current hardcoded for proof of concept however in later implementations the different arrayLists will be sorted and correctly made in DataSorting

  ControlP5 dateList;
  ControlP5 originList;
  ControlP5 destinationList;
  ControlP5 searchButton;
  ControlP5 miscLists;
  String destinationString = null;
  int destinationInt = 0;
  String datesString = null;
  int datesInt = 0;
  String startDatesString = null;
  int startDatesInt = 0;
  String endDatesString = null;
  int endDatesInt = 0;
  String originString = null;
  int originInt = 0;
  String carrierString = null;
  int carrierInt;
  int screenInt;

  String[] boolArray = {"true", "false"};
  String[] screenArray = {"Heat Map", "Table", "Line Graph"};

  DataSorting data = new DataSorting();
  void setup() {



    DataSorting data = new DataSorting();
    data.setup();
    List Origin = data.originList;
    Collections.sort(Origin);
    List Destination = data.destinationList;
    Collections.sort(Destination);
    List DatesArray = data.dateList;
    data.removeTimeAndYear(data.dateList);
    DatesArray.add(0, "--Select Range--");
    List Carriers = data.carrierList;
    Collections.sort(Carriers);

    this.miscLists.addScrollableList("PickScreens")
      .setPosition(100, 500)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(screenArray)
      .setValue(0)
      .close()
      ;

    this.searchButton.addButton("enter")
      .setPosition(100, 700)
      ;

    this.dateList.addScrollableList("Dates")
      .setPosition(100, 50)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(DatesArray)
      .setValue(0)
      //.setFont(createFont("Arial", 15))
      .align(100, 100, 100, 100)
      .close()
      ;

    this.dateList.addScrollableList("Too") //Will only appear when range is selected
      .setVisible(false)
      .setPosition(0, 70)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(DatesArray)
      //.setValue(0)
      .close()
      ;

    this.dateList.addScrollableList("From") //Will only appear when range is selected
      .setVisible(false)
      .setPosition(200, 70)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(DatesArray)
      //.setValue(0)
      .close()
      ;

    this.originList.addScrollableList("Origin")
      .setPosition(40, 350)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(Origin)
      //.setValue(0)
      .close()
      ;

    this.destinationList.addScrollableList("Destination")
      .setPosition(160, 350)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(Destination)
      //.setValue(0)
      .close()
      ;

    this.miscLists.addScrollableList("Is Late")
      .setPosition(100, 150)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(boolArray)
      .close()
      ;

    this.miscLists.addScrollableList("Carriers")
      .setPosition(100, 230)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(Carriers)
      .setValue(0)
      .close()
      ;
  }
  
  void PickScreens(){
    screenInt = (int)miscLists.get(ScrollableList.class, "PickScreens").getValue();
  }
  
  public int getPickScreensInt(){
    PickScreens();
    return screenInt;
  }
  
  void Carriers(int index) {
    carrierString = miscLists.get(ScrollableList.class, "Carriers").getItem(index).get("name").toString();
    carrierInt = (int)miscLists.get(ScrollableList.class, "Carriers").getValue();
  }

  public int getCarrierInt() {
    Carriers(carrierInt);
    return carrierInt;
  }


  void Destination(int index) {
    destinationString = destinationList.get(ScrollableList.class, "Destination").getItem(index).get("name").toString();
    destinationInt = (int)destinationList.get(ScrollableList.class, "Destination").getValue();
  }

  void Dates(int index) {
    datesString = dateList.get(ScrollableList.class, "Dates").getItem(index).get("name").toString();
    datesInt = (int)dateList.get(ScrollableList.class, "Dates").getValue();
  }

  void Too(int index) {
    endDatesString = dateList.get(ScrollableList.class, "Too").getItem(index).get("name").toString();
    endDatesInt = (int)dateList.get(ScrollableList.class, "Too").getValue();
  }

  void From(int index) {
    startDatesString = dateList.get(ScrollableList.class, "From").getItem(index).get("name").toString();
    startDatesInt = (int)dateList.get(ScrollableList.class, "From").getValue();
  }

  void Origin(int index) {
    originString = originList.get(ScrollableList.class, "Origin").getItem(index).get("name").toString();
    originInt = (int)originList.get(ScrollableList.class, "Origin").getValue();
  }

  public int getDestinationInt() {
    Destination(destinationInt);
    return destinationInt;
  }

  public int getDatesInt() {
    Dates(datesInt);
    return datesInt;
  }

  public int getTooInt() {
    Too(endDatesInt);
    return endDatesInt;
  }

  public int getFromInt() {
    From(startDatesInt);
    return startDatesInt;
  }

  public int getOriginInt() {
    Origin(originInt);
    return originInt;
  }

  public String getCarrierString() {
    Carriers(carrierInt);
    return carrierString;
  }

  public String getDestinationString() {
    Destination(destinationInt);
    return destinationString;
  }

  public String getDatesString() {
    Dates(datesInt);
    return datesString;
  }

  public String getTooString() {
    Too(endDatesInt);
    return endDatesString;
  }

  public String getFromString() {
    From(startDatesInt);
    return startDatesString;
  }

  public String getOriginString() {
    Origin(originInt);
    return originString;
  }
}

//void Dates(int dateIndex) {
// println(dateIndex, tempNavBar.dateList.get(ScrollableList.class, "Dates"));
//  //println(dateIndex);
//  if(dateIndex == 2){
//          tempNavBar.dateList.getController("Start-Date")
//      .setVisible(true)
//      .setPosition(0, 75)
//      .setSize(100, 100)
//      .setBarHeight(20)
//      .setItemHeight(20)
//      //.addItems(tempNavBar.Destination)
//      .close()
//      ;
//      tempNavBar.dateList.getController("End-Date")        //creating two different dropdowns that only show up if range of dates is selected
//      .setVisible(true)
//      .setPosition(200, 75)
//      .setSize(100, 100)
//      .setBarHeight(20)
//      .setItemHeight(20)
//      //.addItems(Dates)
//      .close()
//      ;
//    }
//    else{
//      tempNavBar.dateList.getController("Start-Date")
//      .setVisible(false)
//      ;
//      tempNavBar.dateList.getController("End-Date")        //creating two different dropdowns that only show up if range of dates is selected
//      .setVisible(false)
//      ;
//    }
//}
