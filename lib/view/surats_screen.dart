import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/controller/get_surahs_provider.dart';
import 'package:quran/model/surah_model.dart';
import 'package:quran/view/home_screen.dart';

import '../constans.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'القرأن الكريم',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: hexToArgb('#2E3138'),
      ),
      backgroundColor: hexToArgb('#1F2125'),
      body: FutureProvider(
        create: (context) => context.read<GetSurahProvider>().loadSurahs(),
        initialData: SurahModel(),
        child: Consumer<SurahModel>(
          builder: (context, quran, child) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: quran.surahs?.length ?? 0,
              separatorBuilder: (context, index) =>
                  const Divider(thickness: .2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            numberOfAyah: (quran.surahs![index].number! - 1),
                          ),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: hexToArgb('#343A40'),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Text(
                                '${quran.surahs?[index].number}',
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'calibri',
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 8),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${quran.surahs?[index].englishName}',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.87),
                                        fontFamily: 'calibri',
                                        fontSize: 19),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 8),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${quran.surahs?[index].englishNameTranslation}',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.7),
                                        fontFamily: 'calibri',
                                        fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 70,
                          alignment: Alignment.center,
                          child: Text(
                            '${quran.surahs?[index].name}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
