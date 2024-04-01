/*
  Johnny added State class on 24/03
  Used for Heat Map to represent individual states and their colors based
  on the frequency of flights to/from that state.
*/
class State {
  PShape state;
  color stateColor;
  
  State(PShape state, color stateColor) {
    this.state = state;
    this.stateColor = stateColor;
  }
  
  void setColor(color stateColor) {
    this.stateColor = stateColor;
  }
}
