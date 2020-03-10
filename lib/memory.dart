class Memory {
  String result = '';
  String history = '0';

  applyCommand(String label) {
    if (label == 'AC') {
      clear();
    } else {
      result += label;
      history += label;
    }
  }

  clear() {
    result = '';
    history = '';
  }
}
