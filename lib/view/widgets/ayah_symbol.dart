import 'package:flutter/material.dart';
import 'package:quran/view/widgets/convert_english_to_arabic_numbers.dart';

RichText ayahSymbol(int numberOfAyah) {
  return RichText(
    text: TextSpan(
      children: [
        const TextSpan(
          text: '\u06DD',
          style: TextStyle(
            color: Colors.white,
            fontSize: 37,
            fontFamily: 'MUHAMMADI QURANIC FONT',
          ),
        ),
        WidgetSpan(
            child: Container(
          padding: EdgeInsets.only(
              left: paddingNumberInsideSymbol(numberOfAyah), top: 10),
          child: Center(
            child: Text(
              convertEnglishToArabicNumbers(numberOfAyah.toString()),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'nabi',
              ),
            ),
          ),
        ))
      ],
    ),
  );
}

double paddingNumberInsideSymbol(int number) {
  if (number < 10) {
    return 7;
  } else if (number < 100) {
    return 4;
  } else {
    return 1.7;
  }
}
