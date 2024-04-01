import processing.core.PApplet;
import processing.core.PFont;
import java.util.Map;
import java.util.Collections;

class barCharts {
    PApplet parent; // Reference to the parent Processing sketch
    float chartX, chartY, chartWidth, chartHeight;
    Map<String, Integer> frequencies;
    int[] colors; // Use an array for colors
    PFont font1;

    // Adjusted Constructor
    barCharts(PApplet parent, float chartX, float chartY, float chartWidth, float chartHeight, Map<String, Integer> frequencies) {
        this.parent = parent;
        this.chartX = chartX;
        this.chartY = chartY;
        this.chartWidth = chartWidth;
        this.chartHeight = chartHeight;
        this.frequencies = frequencies;

        // Initialize the font and colors within the constructor, using the parent reference
        this.font1 = parent.createFont("Calibri", 14);
        this.colors = new int[]{
            parent.color(255, 0, 0),    // Red
            parent.color(0, 255, 0),    // Green
            parent.color(0, 0, 255),    // Blue
            parent.color(255, 255, 0),  // Yellow
            parent.color(255, 165, 0),  // Orange
            parent.color(255, 0, 255),  // Magenta
            parent.color(0, 255, 255)   // Cyan
        };
    }

    void draw() {
        parent.textFont(font1);
        int maxDataValue = (frequencies.isEmpty()) ? 0 : Collections.max(frequencies.values());
        float barWidth = chartWidth / Math.max(frequencies.size(), 1);
        int i = 0;

        for (Map.Entry<String, Integer> entry : frequencies.entrySet()) {
            float normalizedHeight = PApplet.map(entry.getValue(), 0, maxDataValue, 0, chartHeight);
            parent.fill(colors[i % colors.length]);
            parent.rect(chartX + i * barWidth, chartY + chartHeight - normalizedHeight, barWidth - 5, normalizedHeight);
            parent.fill(0); // Black for text
            parent.textAlign(PApplet.CENTER);
            parent.text(entry.getKey(), chartX + i * barWidth + barWidth / 2, chartY + chartHeight + 20);
            parent.text(entry.getValue().toString(), chartX + i * barWidth + barWidth / 2, chartY + chartHeight - normalizedHeight - 5);
            i++;
        }
    }
}
