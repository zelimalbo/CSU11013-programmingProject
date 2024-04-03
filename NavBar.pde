import controlP5.*;
import java.util.*;
class NavBar {
  //Added A functional yet early navBar with three dropdowns. Eoghan Gloster. 13/3/23
  //The Data below is current hardcoded for proof of concept however in later implementations the different arrayLists will be sorted and correctly made in DataSorting

  ControlP5 allLists;
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

    ////miscLists.addTab("misc")
    ////   .activateEvent(true)
    ////   .setLabel("Misc")
    ////   .setId(2);

    //miscLists.addTab("locations")
    //   .activateEvent(true)
    //   .setLabel("Locations")
    //   .setId(3);

    //miscLists.addTab("dates")
    //   .activateEvent(true)
    //   .setLabel("Dates")
    //   .setId(4);

    DataSorting data = new DataSorting();
    data.setup(totalData);
    ArrayList<String> Origin = new ArrayList<>(data.originList);
    Collections.sort(Origin);
    Origin.add(0, "--All--");
    ArrayList<String> Destination = new ArrayList<>(data.destinationList);
    Collections.sort(Destination);
    Destination.add(0, "--All--");
    ArrayList<String> DatesArray = new ArrayList<>(data.dateList); // Create a new list with the same elements as data.dateList
    ArrayList<String> TooArray = new ArrayList<>(data.dateList); // Do the same for TooArray
    ArrayList<String> FromArray = new ArrayList<>(data.dateList);
    data.removeTimeAndYear(DatesArray);
    data.removeTimeAndYear(TooArray);
    data.removeTimeAndYear(FromArray);
    DatesArray.add(0, "--Select Range--");
    TooArray.add(0, "--Too--");
    FromArray.add(0, "--From--");
    ArrayList<String> Carriers = new ArrayList<>(data.carrierList);
    Collections.sort(Carriers);
    Carriers.add(0, "--All--");

    this.allLists.addScrollableList("PickScreens")
      .setPosition(100, 500)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(screenArray)
      .setValue(0)
      .moveTo("misc")
      .close()
      ;

    //this.searchButton.addButton("enter")
    //  .setPosition(100, 700)
    //  ;

    this.allLists.addScrollableList("Dates")
      .setPosition(100, 50)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(DatesArray)
      .setValue(0)
      //.setFont(createFont("Arial", 15))
      .align(100, 100, 100, 100)
      .moveTo("dates")
      .close()
      ;

    this.allLists.addScrollableList("Too") //Will only appear when range is selected
      .setVisible(false)
      .setPosition(0, 70)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(TooArray)
      .moveTo("dates")
      //.setValue(0)
      .close()
      ;

    this.allLists.addScrollableList("From") //Will only appear when range is selected
      .setVisible(false)
      .setPosition(200, 70)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(FromArray)
      .moveTo("dates")
      //.setValue(0)
      .close()
      ;

    this.allLists.addScrollableList("Origin")
      .setPosition(40, 150)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(Origin)
      .moveTo("locations")
      //.setValue(0)
      .close()
      ;

    this.allLists.addScrollableList("Destination")
      .setPosition(160, 150)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(Destination)
      .moveTo("locations")
      //.setValue(0)
      .close()
      ;

    this.allLists.addScrollableList("Is Late")
      .setPosition(100, 150)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(boolArray)
      .moveTo("misc")
      .close()
      ;

    this.allLists.addScrollableList("Carriers")
      .setPosition(100, 230)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(Carriers)
      .setValue(0)
      .moveTo("misc")
      .close()
      ;
  }

  void PickScreens() {
    screenInt = (int)allLists.get(ScrollableList.class, "PickScreens").getValue();
  }

  public int getPickScreensInt() {
    PickScreens();
    return screenInt;
  }

  void Carriers(int index) {
    carrierString = allLists.get(ScrollableList.class, "Carriers").getItem(index).get("name").toString();
    carrierInt = (int)allLists.get(ScrollableList.class, "Carriers").getValue();
  }

  public int getCarrierInt() {
    Carriers(carrierInt);
    return carrierInt;
  }


  void Destination(int index) {
    destinationString = allLists.get(ScrollableList.class, "Destination").getItem(index).get("name").toString();
    destinationInt = (int)allLists.get(ScrollableList.class, "Destination").getValue();
  }

  void Dates(int index) {
    datesString = allLists.get(ScrollableList.class, "Dates").getItem(index).get("name").toString();
    datesInt = (int)allLists.get(ScrollableList.class, "Dates").getValue();
  }

  void Too(int index) {
    endDatesString = allLists.get(ScrollableList.class, "Too").getItem(index).get("name").toString();
    endDatesInt = (int)allLists.get(ScrollableList.class, "Too").getValue();
  }

  void From(int index) {
    startDatesString = allLists.get(ScrollableList.class, "From").getItem(index).get("name").toString();
    startDatesInt = (int)allLists.get(ScrollableList.class, "From").getValue();
  }

  void Origin(int index) {
    originString = allLists.get(ScrollableList.class, "Origin").getItem(index).get("name").toString();
    originInt = (int)allLists.get(ScrollableList.class, "Origin").getValue();
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
