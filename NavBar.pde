import controlP5.*;
import java.util.*;
class NavBar {
  //Added A functional yet early navBar with three dropdowns. Eoghan Gloster. 13/3/23
  //The Data below is current hardcoded for proof of concept however in later implementations the different arrayLists will be sorted and correctly made in DataSorting

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
  int isLateInt;
  int activeTab = 0;

  String[] boolArray = {"true", "false"};
  String[] screenArray = {"Heat Map", "Table", "Line Graph", "Pie Charts", "Bar Charts"};

  DataSorting data = new DataSorting();
  void setup() {

    //DataSorting data = new DataSorting();
    data.setup(totalData);

    ArrayList<String> Origin = new ArrayList<>(data.originList);
    Collections.sort(Origin);
    Origin.add(0, "--All--");
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
    allLists.addTab("misc").activateEvent(true).setId(3);

    this.allLists.addScrollableList("PickScreens")
      .setPosition(100, 100)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(screenArray)
      .setValue(4)
      .close()
      ;


    this.allLists.addButton("loser")
      .setPosition(50, 200)
      .setSize(200, 50)
      .setLabel("Press Me")
      // Add event listeners for press and release
      .onPress(new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        buttonState = true; // Set state to true when button is pressed
        println("Button Pressed: " + buttonState);
      }
    }
    )
    .onRelease(new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        buttonState = false; // Set state to false when button is released
        println("Button Released: " + buttonState);
      }
    }
    );

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
      //.setFont(createFont("Arial", 15))
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
      .setValue(1)
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

    this.allLists.addScrollableList("Origin")
      .setPosition(40, 100)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(Origin)
      .moveTo("locations")
      .close()
      ;
    this.allLists.addTextlabel("originlabel")
      .setText("Select Origin")
      .setPosition(40, 75) // Positioned above the dropdown
      .setColorValue(0) // Color of the text
      .setFont(createFont("Arial", 13))
      .moveTo("locations")
      ;


    this.allLists.addScrollableList("OriginState")
      .setPosition(160, 100)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(OriginState)
      .moveTo("locations")
      .setValue(0)
      .close()
      ;
    this.allLists.addTextlabel("OriginStatelabel")
      .setText("Select Origin State")
      .setPosition(155, 75) // Positioned above the dropdown
      .setColorValue(0) // Color of the text
      .setFont(createFont("Arial", 13))
      .moveTo("locations")
      ;

    this.allLists.addScrollableList("Is Late")
      .setPosition(100, 100)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(boolArray)
      .moveTo("misc")
      .close()
      ;
    this.allLists.addTextlabel("latelabel")
      .setText("Is Late")
      .setPosition(100, 75) // Positioned above the dropdown
      .setColorValue(0) // Color of the text
      .setFont(createFont("Arial", 16))
      .moveTo("misc")
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
    this.allLists.addTextlabel("carrierslabel")
      .setText("Select Carriers")
      .setPosition(100, 205) // Positioned above the dropdown
      .setColorValue(0) // Color of the text
      .setFont(createFont("Arial", 16))
      .moveTo("misc")
      ;
  }

  void isLate() {
    isLateInt = (int)allLists.get(ScrollableList.class, "isLate").getValue();
  }
  int getIsLateInt() {
    isLate();
    return isLateInt;
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

  void controlEvent(ControlEvent theControlEvent) {
    if (theControlEvent.isTab()) {
      activeTab = theControlEvent.getTab().getId();
    }
  }
  public int getActiveTab() {
    return activeTab;
  }
}
