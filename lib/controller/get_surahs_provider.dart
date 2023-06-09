import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/model/surah_model.dart';
import 'package:quran/model/tafseer_model.dart';

class GetSurahProvider extends ChangeNotifier {
  Future<String> loadJsonAsset() async {
    return await rootBundle.loadString('assets/quran.json');
  }

  Future<String> loadTafseerJsonAsset() async {
    return await rootBundle.loadString('assets/kurdish_pwxta_tafseer.json');
  }

  Future<SurahModel> loadSurahs() async {
    String jsonString = await loadJsonAsset();
    final jsonResponse = jsonDecode(jsonString);
    final surahModel = SurahModel.fromJson(jsonResponse);
    return surahModel;
  }

  Future<TafseerModel> loadTafsir() async {
    String jsonString = await loadTafseerJsonAsset();
    final jsonResponse = jsonDecode(jsonString);
    final tafseerModel = TafseerModel.fromJson(jsonResponse);
    return tafseerModel;
  }
}
