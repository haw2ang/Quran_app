import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/constans.dart';
import 'package:quran/controller/get_surahs_provider.dart';
import 'package:quran/model/surah_model.dart';
import 'package:quran/model/tafseer_model.dart';
import 'package:quran/view/widgets/ayah_symbol.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.name, required this.ayahs});

  final String name;
  final List<Ayahs> ayahs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: hexToArgb('#1F2125'),
        appBar: AppBar(
          title: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: hexToArgb('#2E3138'),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: FutureProvider(
            create: (context) => context.read<GetSurahProvider>().loadTafsir(),
            initialData: TafseerModel(),
            child: Consumer<TafseerModel>(
              builder: (context, kurdish, child) {
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: .2),
                  itemCount: ayahs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: Row(
                        children: [
                          ayahSymbol(ayahs[index].numberInSurah ?? 0),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 20.0),
                                  child: Text(
                                    '${ayahs[index].text}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        wordSpacing: 5,
                                        height: 1.8),
                                    softWrap: true,
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 20.0),
                                  child: Text(
                                    '${kurdish.tafseers?[ayahs[index].number! - 1]}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        wordSpacing: 5,
                                        height: 1.8),
                                    softWrap: true,
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            )));
  }
}
