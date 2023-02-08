import 'package:flutter/material.dart';
import 'package:quran/controller/get_surah_api.dart';
import 'package:quran/model/initial_model.dart';
import 'package:quran/view/home_screen.dart';

class SuratScreen extends StatefulWidget {
  const SuratScreen({super.key});

  @override
  State<SuratScreen> createState() => _SuratScreenState();
}

class _SuratScreenState extends State<SuratScreen> {
  late Future<Initial> futureAlbum;
  GetSurah getSutah = GetSurah();

  @override
  void initState() {
    super.initState();
    futureAlbum = getSutah.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.data!.surahs!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        numberOfAyah: (snapshot.data!.data!.surahs![index].number! - 1),
                      ),
                    ));
              },
              child: Container(
                height: 70,
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
                child: Text(
                  '${snapshot.data!.data!.surahs![index].name}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
