import 'package:flutter/material.dart';

class ActionProvider extends ChangeNotifier {
  double fontSize = 10;
  double fontSizeOfTafseer = 10;
  List<String> dropdownFontOptions = [
    'nabi',
    'Amiri',
    'MUHAMMADI QURANIC FONT',
    'Neirizi',
    'Me Quran',
    'Hafs',
    'Arslan Wessam'
  ];
  String selectedFont = 'nabi';
  List<String> dropdownTafseerFontOptions = [
    'nabi',
    'NRT',
    'Nizar',
    'K24',
    'Rudaw',
    'Speda'
  ];
  String selectedTafseerFont = 'nabi';

  void changeFontSize(newValue) {
    fontSize = newValue;
    notifyListeners();
  }

  void changeFontSizeOfTafseer(newValue) {
    fontSizeOfTafseer = newValue;
    notifyListeners();
  }

  void changeFontFamily(newValue) {
    selectedFont = newValue;
    notifyListeners();
  }

  void changeTafseerFontFamily(newValue) {
    selectedTafseerFont = newValue;
    notifyListeners();
  }
}
