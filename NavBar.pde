import controlP5.*;
import java.util.*;
class NavBar {
  //Added A functional yet early navBar with three dropdowns. Eoghan Gloster. 13/3/23
  //The Data below is current hardcoded for proof of concept however in later implementations the different arrayLists will be sorted and correctly made in DataSorting
  
  ControlP5 dateList;
  ControlP5 originList;
  ControlP5 destinationList;
  ControlP5 searchButton;
  int dateIndexes =0;

  List Dates = Arrays.asList("--All DATES--", "--SELECT RANGE--", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14",
    "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31");

  List Origin = Arrays.asList("--ALL ORIGINS--", "ANC", "ATL", "ABQ", "BIS", "BUF", "BOS", "BZN", "BUR", "BWI", "CVG", "CID", "CRP",
    "CHS", "CLE", "DAL", "DCA", "DEN", "DTW", "EWR", "EUG", "FAI", "FAR", "FAT", "FLL", "GEG", "GSP", "GJT", "HNL", "HOU", "HPN", "ITO", "IDA",
    "IND", "JAX", "JFK", "JAN", "JNU", "KOA", "LAS", "LAX", "LGA", "LIH", "MCO", "MCI", "MEM", "MFE", "MFR", "MIA", "MSP", "MSO", "MSY", "MYR",
    "OAK", "OGG", "ONT", "ORD", "OMA", "PDX", "PBI", "PHL", "PHX", "PIT", "PSP", "RNO", "RDU", "RSW", "SAN", "SAT", "SAV", "SEA", "SFO", "SJC",
    "SJU", "SIT", "SNA", "SMF", "SRQ", "STL", "TPA", "TUL", "VPS", "WRG", "XNA", "YAK");

  List Destination = Arrays.asList("--ALL DESTINATIONS--", "ANC", "ATL", "ABQ", "BIS", "BUF", "BOS", "BZN", "BUR", "BWI", "CVG", "CID", "CRP",
    "CHS", "CLE", "DAL", "DCA", "DEN", "DTW", "EWR", "EUG", "FAI", "FAR", "FAT", "FLL", "GEG", "GSP", "GJT", "HNL", "HOU", "HPN", "ITO", "IDA",
    "IND", "JAX", "JFK", "JAN", "JNU", "KOA", "LAS", "LAX", "LGA", "LIH", "MCO", "MCI", "MEM", "MFE", "MFR", "MIA", "MSP", "MSO", "MSY", "MYR",
    "OAK", "OGG", "ONT", "ORD", "OMA", "PDX", "PBI", "PHL", "PHX", "PIT", "PSP", "RNO", "RDU", "RSW", "SAN", "SAT", "SAV", "SEA", "SFO", "SJC",
    "SJU", "SIT", "SNA", "SMF", "SRQ", "STL", "TPA", "TUL", "VPS", "WRG", "XNA", "YAK");


   void setup() {
    //dateList = new ControlP5(this);
    //originList = new ControlP5(this);
    //destinationList = new ControlP5(this);
    //searchButton = new ControlP5(this);

    this.searchButton.addButton("enter")
      .setPosition(100, 700)
      ;

    this.dateList.addScrollableList("Dates")
      .setPosition(100, 50)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(tempNavBar.Dates)
      .setValue(0)
      .close()
      ;

    this.dateList.addScrollableList("Start-Date")      //creating two different dropdowns that only show up if range of dates is selected
      .setVisible(false)
      .setPosition(100, 75)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(tempNavBar.Dates)
      .close()
      ;

    //this.dateList.addScrollableList("Start-Date")
    //  .setVisible(false)
    //  ;


    this.dateList.addScrollableList("End-Date")        //creating two different dropdowns that only show up if range of dates is selected
      .setVisible(false)
      .setPosition(100, 100)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(tempNavBar.Dates)
      .close()
      ;

    this.originList.addScrollableList("Origin")

      .setPosition(100, 200)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(tempNavBar.Origin)
      .setValue(0)
      .close()
      ;

    this.destinationList.addScrollableList("Destination")
      .setPosition(100, 350)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(tempNavBar.Destination)
      .setValue(0)
      .close()
      ;
  }

  public void Dates(int dateIndex) {
    /* request the selected item based on index n */
    dateIndexes = dateIndex;
    println(dateIndex);
  }

  public void Origin(int originIndex) {
    /* request the selected item based on index n */
    println(originIndex);
    println(Origin.get(originIndex));
  }

  public void Destination(int destinationIndex) {
    /* request the selected item based on index n */
    println(destinationIndex);
    println(Destination.get(destinationIndex));
  }
}
