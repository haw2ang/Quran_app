import 'package:flutter/material.dart';
import 'package:quran/controller/get_surah_api.dart';
import 'package:quran/model/initial_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.numberOfAyah});

  final int numberOfAyah;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    GetSurah getSurah = GetSurah();

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(),
        body: FutureBuilder(
          future: getSurah.loadData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
              reverse: false,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.data!.surahs![widget.numberOfAyah].ayahs!.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${snapshot.data!.data!.surahs![widget.numberOfAyah].ayahs![index].text}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
