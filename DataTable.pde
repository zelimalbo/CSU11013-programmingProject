/* 
  Implemented DataTable class to visualize a table on screen.
  Johnny
  20/03
*/

class DataTable {
  int rows;
  int columns;
  int column_width;
  int margin = 10;
  int row_height;
  int footer_ypos = SCREENY - 150;
  int footer_height = 150;
  int rows_per_page = 15;
  int currentPage = 1;
  int totalPages;
  Table data;
  ArrayList controls = new ArrayList();
  int event = 0;
  final int FORWARD = 1;
  final int BACKWARD = -1;
  final int SEARCH = 2;
  PFont tableFont = loadFont("Calibri-14.vlw");
  PFont footerFont = loadFont("Calibri-20.vlw");
  /*
  Include 
  column 1 - date
  column 2 - MKT_CARRIER
  column 4 - ORIGIN
  column 5 - ORIGIN_CITY_NAME
  column 8 - DEST
  column 9 - DEST_CITY_NAME
  column 16 - CANCELLED
  column 17 - DIVERTED
  coulmn 18 - DISTANCE
  */
  DataTable(Table data, ArrayList includedColumns) {
    this.data = data;
    ArrayList<String> columnsToRemove = new ArrayList<String>();
    for (int i = 1; i < data.getColumnCount() + 1; i++) {
      if (!includedColumns.contains(i)) {
        columnsToRemove.add(data.getColumnTitle(i-1));
      }
    }
    for (int i = 0; i < columnsToRemove.size(); i++) {
      this.data.removeColumn(columnsToRemove.get(i));
    }    
    columns = this.data.getColumnCount();
    rows = data.getRowCount();
    column_width = (SCREEN_WIDTH - (margin * 2)) / columns;
    row_height = (SCREENY - footer_height - (margin * 2)) / rows_per_page;
    controls.add(new Widget(SCREENX-(margin*2)-100,
      SCREENY-(margin*2)-40, 100, 40, "Forward",
      #03A0FF, tableFont, FORWARD));
    controls.add(new Widget(SCREENX-(margin*3)-100-100, 
      SCREENY-(margin*2)-40, 100, 40, "Back",
      #03A0FF, tableFont, BACKWARD));
    controls.add(new TextWidget(SCREENX-(margin*3)-100-100, 
      SCREENY-(margin*3)-40-40, 205, 40, "Find Page",
      #FFFFFF, tableFont, SEARCH, 200)); 
    totalPages = rows / (rows_per_page - 1);
    int remainder = rows - (totalPages * (rows_per_page - 1));
    if (remainder != 0) {
      totalPages += 1;
    }
  }
  
  void draw() {
    textAlign(CENTER, CENTER);
    textFont(tableFont);
    fill(#B4E5FF);
    rect(NAV_BAR_WIDTH + margin, footer_ypos, SCREEN_WIDTH - (margin * 2), footer_height - margin);
    stroke(0);
    rect(NAV_BAR_WIDTH + margin, margin, column_width, row_height);
    for (int i = 0; i < columns; i++) {
      fill(#B4E5FF);
      rect((NAV_BAR_WIDTH + margin) + (column_width * i), margin, column_width, row_height);
      fill(0);
      String title = data.getColumnTitle(i);
      text(title, (NAV_BAR_WIDTH + margin + (column_width/2)) + (column_width * i), margin + (row_height/2));
    }
    for (int row = 0; row < rows_per_page - 1; row++) {
      for (int column = 0; column < columns; column++) {
        fill(255);
        rect((NAV_BAR_WIDTH + margin) + (column_width * column), row_height + margin + (row_height * row), column_width, row_height);
        if (row+((currentPage-1)*(rows_per_page-1)) < rows) {
          String text = data.getString(row+((currentPage-1)*(rows_per_page-1)), column);
          fill(0);
          text(text, (NAV_BAR_WIDTH + margin + (column_width/2)) + (column_width * column), row_height + margin + (row_height/2) + (row_height*row));
        }
      }
    }
    for (int i = 0; i < controls.size(); i++) {
      Widget widget = (Widget) controls.get(i);
      widget.draw();
    }
    String text = "Current Page: " + Integer.toString(currentPage);
    textFont(footerFont);
    textAlign(LEFT, TOP);
    text(text, SCREENX - (margin*3) - 200, SCREENY - footer_height + margin);
  }
  
  void getEvent(int mx, int my) {
    for (int i = 0; i<controls.size(); i++) {
      Widget aWidget = (Widget) controls.get(i);
      event = aWidget.getEvent(mx, my);
      if (event == 1 && currentPage < totalPages) {
        currentPage += event;
      }
      else if (event == -1 && currentPage > 1) {
        currentPage += event;
      }
    }
  }
}
