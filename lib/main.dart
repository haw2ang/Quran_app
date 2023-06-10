import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/controller/actions_provider.dart';
import 'package:quran/view/screens/surats_screen.dart';
import 'controller/get_surahs_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<SurahProvider>(
        create: (context) => SurahProvider(),
      ),
      ChangeNotifierProvider<ActionProvider>(
        create: (context) => ActionProvider(),
      ),
    ], child: MaterialWidget());
  }
}

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ActionProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: value.selectedFont,
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: value.fontSize),
            ),
          ),
          home: const SurahScreen(),
        );
      },
    );
  }
}
