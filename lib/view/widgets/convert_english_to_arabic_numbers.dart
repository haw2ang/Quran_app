String convertEnglishToArabicNumbers(String input) {
  Map numbers = {
    '0': '۰',
    '1': '۱',
    '2': '۲',
    '3': '۳',
    '4': '٤',
    '5': '٥',
    '6': '٦',
    '7': '۷',
    '8': '۸',
    '9': '۹',
  };

  numbers.forEach((key, value) => input = input.replaceAll(key, value));

  return input;
}
