import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/view/surats_screen.dart';

import 'controller/get_surahs_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetSurahProvider>(
          create: (context) => GetSurahProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'nabi',
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 22.0),
          ),
        ),
        home: const SurahScreen(),
      ),
    );
  }
}
