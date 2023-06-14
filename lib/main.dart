import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:quran/constans.dart';
import 'package:quran/controller/actions_provider.dart';
import 'package:quran/view/screens/surats_screen.dart';
import 'controller/get_surahs_provider.dart';

void main() async {
  await GetStorage.init();
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
      ChangeNotifierProvider(
        create: (context) => ActionProvider()..check(),
      )
    ], child: const MaterialWidget());
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
            fontFamily: storage.read('selectedFont'),
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: storage.read('fontSize')),
            ),
          ),
          home: const SurahScreen(),
        );
      },
    );
  }
}
