//zelim
class barCharts {
  float chartX = 322;

  void draw() {
    fill(245);
    rect(1350, 0, 200, height);
  }

  //draw a bar chart with customizable parameters
  void drawBarChart(float chartX, float chartY, float chartWidth, float chartHeight, int[] data, color[] colors, String[] labels) {
    if (data.length != colors.length || data.length != labels.length) {
      println("Error: Data, colors, and labels arrays must have the same length.");
      return;
    }

    float maxDataValue = max(data);
    float barWidth = chartWidth / data.length;

    for (int i = 0; i < data.length; i++) {
      float normalizedHeight = map(data[i], 0, maxDataValue, 0, chartHeight);
      fill(colors[i]);
      rect(chartX + i * barWidth, chartY + chartHeight - normalizedHeight, barWidth - 5, normalizedHeight);

      fill(0);
      textAlign(CENTER);
      text(labels[i], chartX + i * barWidth + barWidth / 2, chartY + chartHeight + 15);
    }
  }

  void dateOnly() {
    int[] data = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 7, 8, 9, 20, 1, 2, 3, 4, 5, 6, 7, 8, 9, 30, 31};
    color[] colors = {#800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16};
    String[] labels = {"1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th", "9th", "10th", "11th", "12th", "13th", "14th", "15th", "16th", "17th", "18th", "19th", "20th", "21st", "22nd", "23rd", "24th", "25th", "26th", "27th", "28th", "29th", "30th", "31st"};

    drawBarChart(400, 200, 900, 500, data, colors, labels); // Draw the chart with specified parameters
  }
  
  void carrierOnly() {
    int[] data = {1, 3, 6, 42, 45, 32, 43, 12, 27, 50};
    color[] colors = {#800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16};
    String[] labels = {"AA", "AS", "B6", "DL", "F9", "G4", "NK", "UA", "WN", "HA"};

    drawBarChart(400, 200, 900, 500, data, colors, labels);
  }

  void originOnly() {
    int[] data = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369};
    color[] colors = {#800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16, #800e16};
    String[] labels = { "ABE", "ABI", "ABQ", "ABR", "ABY", "ACT", "ACV", "ACY", "ADK", "ADQ", "AEX", "AGS", "AKN", "ALB", "ALO", "ALS", "ALW", "AMA", "ANC", "APN", "ART", "ASE", "ATL", "ATW", "ATY", "AUS", "AVL", "AVP", "AZA", "AZO", "BDL", "BET", "BFF", "BFL", "BGM", "BGR", "BHM", "BIH", "BIL", "BIS", "BJI", "BLI", "BLV", "BMI", "BNA", "BOI", "BOS", "BPT", "BQK", "BQN", "BRD", "BRO", "BRW", "BTM", "BTR", "BTV", "BUF", "BUR", "BWI", "BZN", "CAE", "CAK", "CDC", "CDV", "CGI", "CHA", "CHO", "CHS", "CID", "CIU", "CKB", "CLE", "CLL", "CLT", "CMH", "CMI", "CMX", "CNY", "COD", "COS", "COU", "CPR", "CRP", "CRW", "CSG", "CVG", "CWA", "CYS", "DAB", "DAL", "DAY", "DBQ", "DCA", "DDC", "DEC", "DEN", "DFW", "DHN", "DIK", "DLG", "DLH", "DRO", "DRT", "DSM", "DTW", "DVL", "EAR", "EAT", "EAU", "ECP", "EGE", "EKO", "ELM", "ELP", "ERI", "ESC", "EUG", "EVV", "EWN", "EWR", "EYW", "FAI", "FAR", "FAT", "FAY", "FCA", "FLG", "FLL", "FLO", "FNT", "FOD", "FSD", "FSM", "FWA", "GCC", "GCK", "GEG", "GFK", "GGG", "GJT", "GNV", "GPT", "GRB", "GRI", "GRK", "GRR", "GSO", "GSP", "GTF", "GTR", "GUC", "GUM", "HDN", "HGR", "HHH", "HIB", "HLN", "HNL", "HOB", "HOU", "HPN", "HRL", "HSV", "HTS", "HYS", "IAD", "IAG", "IAH", "ICT", "IDA", "ILG", "ILM", "IMT", "IND", "INL", "ISP", "ITH", "ITO", "JAC", "JAN", "JAX", "JFK", "JLN", "JMS", "JNU", "JST", "KOA", "KTN", "LAN", "LAR", "LAS", "LAW", "LAX", "LBB", "LBE", "LBF", "LBL", "LCH", "LCK", "LEX", "LFT", "LGA", "LGB", "LIH", "LIT", "LNK", "LRD", "LSE", "LWB", "LWS", "LYH", "MAF", "MBS", "MCI", "MCO", "MCW", "MDT", "MDW", "MEI", "MEM", "MFE", "MFR", "MGM", "MHK", "MHT", "MIA", "MKE", "MKG", "MLB", "MLI", "MLU", "MOB", "MOT", "MQT", "MRY", "MSN", "MSO", "MSP", "MSY", "MTJ", "MYR", "OAJ", "OAK", "OGD", "OGG", "OGS", "OKC", "OMA", "OME", "ONT", "ORD", "ORF", "ORH", "OTH", "OTZ", "OWB", "PAE", "PAH", "PBG", "PBI", "PDX", "PGD", "PGV", "PHF", "PHL", "PHX", "PIA", "PIB", "PIE", "PIH", "PIR", "PIT", "PLN", "PNS", "PPG", "PQI", "PRC", "PSC", "PSE", "PSG", "PSM", "PSP", "PUB", "PUW", "PVD", "PVU", "PWM", "RAP", "RDD", "RDM", "RDU", "RFD", "RHI", "RIC", "RIW", "RKS", "RNO", "ROA", "ROC", "ROW", "RST", "RSW", "SAF", "SAN", "SAT", "SAV", "SBA", "SBN", "SBP", "SBY", "SCC", "SCE", "SCK", "SDF", "SEA", "SFB", "SFO", "SGF", "SGU", "SHD", "SHR", "SHV", "SIT", "SJC", "SJT", "SJU", "SLC", "SLN", "SMF", "SMX", "SNA", "SPI", "SPN", "SPS", "SRQ", "STC", "STL", "STS", "STT", "STX", "SUN", "SUX", "SWF", "SWO", "SYR", "TBN", "TLH", "TOL", "TPA", "TRI", "TTN", "TUL", "TUS", "TVC", "TWF", "TXK", "TYR", "TYS", "USA", "VCT", "VEL", "VLD", "VPS", "WRG", "XNA", "XWA", "YAK", "YKM", "YUM"};

    drawBarChart(chartX, 200, 20000, 500, data, colors, labels);
  }

  void buttons() {
    cp5.addButton("Previous Page")
      .setValue(0)
      .setPosition(1100, 750)
      .setSize(100, 19)
      .addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        if (event.getAction() == ControlP5.ACTION_PRESSED) {
          previousPageButton(); // Call the function to perform the action
        }
      }
    }
    );

    cp5.addButton("Next Page")
      .setValue(0)
      .setPosition(1250, 750)
      .setSize(100, 19)
      .addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        if (event.getAction() == ControlP5.ACTION_PRESSED) {
          nextPageButton(); // Call the function to perform the action
        }
      }
    }
    );
  }

  void nextPageButton() {
    if (chartX >= -19000)
    {
      chartX -= 542;
      originOnly();
    }
  }

  void previousPageButton() {
    if (chartX <= 400)
    {
      chartX += 542;
      originOnly();
    }
  }
}
