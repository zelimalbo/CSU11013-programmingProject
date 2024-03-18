

class NavBar {
  //Added A functional yet early navBar with three dropdowns. Eoghan Gloster. 13/3/23
  //The Data below is current hardcoded for proof of concept however in later implementations the different arrayLists will be sorted and correctly made in DataSorting

  ControlP5 dateList;
  ControlP5 originList;
  ControlP5 destinationList;

  List Dates = Arrays.asList("--All DATES--", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14",
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



  void Dates(int dateIndex) {
    /* request the selected item based on index n */
    println(dateIndex);
  }

  void Origin(int originIndex) {
    /* request the selected item based on index n */
    println(originIndex);
    println(Origin.get(originIndex));
  }

  void Destination(int destinationIndex) {
    /* request the selected item based on index n */
    println(destinationIndex);
    println(Destination.get(destinationIndex));
  }
}
