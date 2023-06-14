import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Color hexToArgb(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  int colorInt = int.parse(hexColor, radix: 16);
  if (hexColor.length == 6) {
    colorInt = 0xFF000000 | colorInt;
  }
  return Color(colorInt);
}

final storage = GetStorage();
