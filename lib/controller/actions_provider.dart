import 'package:flutter/material.dart';
import 'package:quran/constans.dart';

class ActionProvider extends ChangeNotifier {
  List<String> dropdownFontOptions = [
    'nabi',
    'Amiri',
    'MUHAMMADI QURANIC FONT',
    'Neirizi',
    'Me Quran',
    'Hafs',
    'Arslan Wessam'
  ];
  List<String> dropdownTafseerFontOptions = [
    'nabi',
    'NRT',
    'Nizar',
    'K24',
    'Rudaw',
    'Speda'
  ];

  void changeFontSize(newValue) {
    double x = storage.read('fontSize');
    x = newValue;
    storage.write('fontSize', x);
    notifyListeners();
  }

  void changeFontSizeOfTafseer(newValue) {
    double x = storage.read('fontSizeOfTafseer');
    x = newValue;
    storage.write('fontSizeOfTafseer', x);
    notifyListeners();
  }

  void changeFontFamily(newValue) {
    String x = storage.read('selectedFont');
    x = newValue;
    storage.write('selectedFont', x);
    notifyListeners();
  }

  void changeTafseerFontFamily(newValue) {
    String x = storage.read('selectedTafseerFont');
    x = newValue;
    storage.write('selectedTafseerFont', x);
    notifyListeners();
  }

  Future<void> check() async {
    storage.writeIfNull('fontSize', 10.0);
    storage.writeIfNull('fontSizeOfTafseer', 10.0);
    storage.writeIfNull('selectedFont', 'nabi');
    storage.writeIfNull('selectedTafseerFont', 'nabi');
  }
}
