import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/model/initial_model.dart';

class GetSurah extends ChangeNotifier {
  Future<String> loadJsonAsset() async {
    return await rootBundle.loadString('assets/fatiha.json');
  }

  Future<Initial> loadData() async {
    String jsonString = await loadJsonAsset();
    final jsonResponse = Initial.fromJson(jsonDecode(jsonString));
    return jsonResponse;
  }
}
