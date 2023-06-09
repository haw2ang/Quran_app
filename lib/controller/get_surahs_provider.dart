import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/model/surah_model.dart';

class GetSurahProvider extends ChangeNotifier {
  Future<String> loadJsonAsset() async {
    return await rootBundle.loadString('assets/fatiha.json');
  }

  Future<SurahModel> loadSurahs() async {
    String jsonString = await loadJsonAsset();
    final jsonResponse = jsonDecode(jsonString);
    final surahModel = SurahModel.fromJson(jsonResponse);
    return surahModel;
  }
}
