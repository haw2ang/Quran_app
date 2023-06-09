import 'package:flutter/material.dart';
import 'package:quran/controller/get_surahs_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.numberOfAyah});

  final int numberOfAyah;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    GetSurahProvider getSurah = GetSurahProvider();

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: FutureBuilder(
          future: getSurah.loadSurahs(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            return ListView.builder(
              reverse: false,
              scrollDirection: Axis.vertical,
              itemCount:
                  snapshot.data!.surahs![widget.numberOfAyah].ayahs!.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${snapshot.data!.surahs![widget.numberOfAyah].ayahs![index].text}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
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
