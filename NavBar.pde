import controlP5.*;
import java.util.*;
class NavBar {
  //Added A functional yet early navBar with three dropdowns. Eoghan Gloster. 13/3/23

  ControlP5 allLists;
  String OriginStateString = null;
  int OriginStateInt = 0;
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
  boolean buttonState = false;
  int activeTab = 0;
  int filterInt = 0;
  int originOrStateInt = 0;
  int filterStateInt = 0;

  String[] screenArray = {"Heat Map", "Table", "Line Graph", "Pie Charts"};
  String[] whatToFilter ={"Origin Airport", "Destination Airport", "Origin State", "Destination State", "Carrier"};
  String[] whatToFilterState ={"Destination Airport", "Destination State","Carrier"};

  DataSorting data = new DataSorting();
  void setup() {

    //DataSorting data = new DataSorting();
    data.setup(totalData);

    ArrayList<String> Origin = new ArrayList<>(data.originList);
    Collections.sort(Origin);
    ArrayList<String> OriginState = new ArrayList<>(data.originStateList);
    Collections.sort(OriginState);
    ArrayList<String> DatesArray = new ArrayList<>(data.dateList); // Create a new list with the same elements as data.dateList
    ArrayList<String> TooArray = new ArrayList<>(data.dateList); // Do the same for TooArray
    ArrayList<String> FromArray = new ArrayList<>(data.dateList);
    data.removeTimeAndYear(DatesArray);
    data.removeTimeAndYear(TooArray);
    data.removeTimeAndYear(FromArray);
    DatesArray.add(0, "--Select Range--");
    ArrayList<String> Carriers = new ArrayList<>(data.carrierList);
    Collections.sort(Carriers);
    Carriers.add(0, "--All--");

    allLists.getTab("default").activateEvent(true).setId(0);
    allLists.addTab("dates").activateEvent(true).setId(1);
    allLists.addTab("locations").activateEvent(true).setId(2);
   // allLists.addTab("carriers").activateEvent(true).setId(3);

    this.allLists.addScrollableList("PickScreens")
      .setPosition(100, 100)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(screenArray)
      .setValue(0)
      .close()
      ;

    this.allLists.addTextlabel("label")
      .setText("Select Screen")
      .setPosition(95, 75) // Positioned above the dropdown
      .setColorValue(0) // Color of the text
      .setFont(createFont("Arial", 16))
      ;

    this.allLists.addScrollableList("Dates")
      .setPosition(100, 100)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(DatesArray)
      .setValue(1)
      .align(100, 100, 100, 100)
      .moveTo("dates")
      .close()
      ;
    this.allLists.addTextlabel("datelabel")
      .setText("Select Date")
      .setPosition(100, 75) // Positioned above the dropdown
      .setColorValue(0) // Color of the text
      .setFont(createFont("Arial", 16))
      .moveTo("dates")
      ;

    this.allLists.addScrollableList("Too") //Will only appear when range is selected
      .setVisible(false)
      .setPosition(0, 120)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(TooArray)
      .moveTo("dates")
      .setValue(0)
      .close()
      ;

    this.allLists.addScrollableList("From") //Will only appear when range is selected
      .setVisible(false)
      .setPosition(200, 120)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(FromArray)
      .moveTo("dates")
      .setValue(1)
      .close()
      ;

    this.allLists.addScrollableList("Filter")
      .setPosition(100, 250)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(whatToFilter)
      .setValue(0)
      .moveTo("dates")
      .close()
      ;

    this.allLists.addTextlabel("howtoFilter")
      .setText("Filter By")
      .setPosition(120, 225) // Positioned above the dropdown
      .setColorValue(0) // Color of the text
      .setFont(createFont("Arial", 16))
      .moveTo("dates")
      ;

    this.allLists.addTextlabel("OriginStatelabel")
      .setText("Filter by Airport or Origin State")
      .setPosition(0, 75) // Positioned above the dropdown
      .setColorValue(0) // Color of the text
      .setFont(createFont("Arial", 13))
      .moveTo("locations")
      ;

    this.allLists.addScrollableList("originOrState") //Will only appear when range is selected
      .setPosition(0, 100)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(Arrays.asList("By Airport", "By State"))
      .moveTo("locations")
      .setValue(0)
      .close()
      ;

    this.allLists.addScrollableList("Origin")
      .setVisible(false)
      .setPosition(100, 170)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(Origin)
      .moveTo("locations")
      .setValue(0)
      .close()
      ;


    this.allLists.addScrollableList("OriginState")
      .setVisible(false)
      .setPosition(100, 170)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(OriginState)
      .moveTo("locations")
      .setValue(0)
      .close()
      ;

    this.allLists.addScrollableList("FilterState")
      .setPosition(200, 100)
      .setSize(100, 75)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(whatToFilterState)
      .setValue(0)
      .moveTo("locations")
      .close()
      ;

    this.allLists.addTextlabel("howtoFilterState")
      .setText("Filter By")
      .setPosition(200, 75) // Positioned above the dropdown
      .setColorValue(0) // Color of the text
      .setFont(createFont("Arial", 13))
      .moveTo("locations")
      ;

  }


  void PickScreens() {
    screenInt = (int)allLists.get(ScrollableList.class, "PickScreens").getValue();
  }

  public int getPickScreensInt() {
    PickScreens();
    return screenInt;
  }

  void originOrState() {
    originOrStateInt = (int)allLists.get(ScrollableList.class, "originOrState").getValue();
  }

  public int originOrStateInts() {
    originOrState();
    return originOrStateInt;
  }

  void filter() {
    filterInt = (int)allLists.get(ScrollableList.class, "Filter").getValue();
  }
  public int getFilterInt() {
    filter();
    return filterInt;
  }
  
  void FilterState() {
    filterStateInt = (int)allLists.get(ScrollableList.class, "FilterState").getValue();
  }
  public int getFilterStateInt() {
    FilterState();
    return filterStateInt;
  }

  void Carriers(int index) {
    carrierString = allLists.get(ScrollableList.class, "Carriers").getItem(index).get("name").toString();
    carrierInt = (int)allLists.get(ScrollableList.class, "Carriers").getValue();
  }

  public int getCarrierInt() {
    Carriers(carrierInt);
    return carrierInt;
  }




  void OriginState(int index) {
    OriginStateString = allLists.get(ScrollableList.class, "OriginState").getItem(index).get("name").toString();
    OriginStateInt = (int)allLists.get(ScrollableList.class, "OriginState").getValue();
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

  public int getOriginStateInt() {
    OriginState(OriginStateInt);
    return OriginStateInt;
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

  public String getOriginStateString() {
    OriginState( OriginStateInt);
    return OriginStateString;
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

  public void disappearingDates(int dateSelection) {                     //ADDED BY EOGHAN VERY IMPORTANT
    if (dateSelection==0) {
      this.allLists.getController("Too").setVisible(true);
      this.allLists.getController("From").setVisible(true);
    } else {
      this.allLists.getController("Too").setVisible(false);
      this.allLists.getController("From").setVisible(false);
    }
  }

  public void disapearingSort(int sortSelection) {
    if (sortSelection == 1) {
      this.allLists.getController("OriginState").setVisible(true);
      this.allLists.getController("Origin").setVisible(false);
    }
    if (sortSelection == 0) {
      this.allLists.getController("OriginState").setVisible(false);
      this.allLists.getController("Origin").setVisible(true);
    }
  }

  void controlEvent(ControlEvent theControlEvent) {
    if (theControlEvent.isTab()) {
      activeTab = theControlEvent.getTab().getId();
    }
  }
  public int getActiveTab() {
    return activeTab;
  }
}
