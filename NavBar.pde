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
      .setFont(createFont("Arial", 15))
      .align(100,100,100,100)
      .close()
      ;
      
    this.originList.addScrollableList("Origin")
      .setPosition(100, 200)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(Origin)
      .setValue(0)
      .close()
      ;

    this.destinationList.addScrollableList("Destination")
      .setPosition(100, 350)
      .setSize(100, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(Destination)
      .setValue(0)
      .close()
      ;
  }
  
  


  public void Dates(int dateIndex) {
    /* request the selected item based on index n */
    dateIndexes = dateIndex;
    println(dateIndex);
    //if(dateIndexes == 2){
    //      this.dateList.addScrollableList("Start-Date")
    //  .setVisible(true)
    //  ;
    //}
  }

  public void Origin(int originIndex) {
    /* request the selected item based on index n */
    println(originIndex);
    //println(this.Origin.get(originIndex));
  }

  public void Destination(int destinationIndex) {
    /* request the selected item based on index n */
    println(destinationIndex);
    //println(this.Destination.get(destinationIndex));
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
