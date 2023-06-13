import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/constans.dart';
import 'package:quran/controller/actions_provider.dart';
import 'package:quran/view/widgets/custom_text_inside_thumb_shape.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToArgb('#1F2125'),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: hexToArgb('#2E3138'),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Consumer<ActionProvider>(
        builder: (context, actionProvider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '﻿بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: actionProvider.fontSize,
                    fontFamily: actionProvider.selectedFont,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'به‌ناوی خوای به‌خشنده‌ی میهره‌بان',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: actionProvider.fontSizeOfTafseer,
                    fontFamily: actionProvider.selectedTafseerFont,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: CustomSliderTextInsideThumbShape(
                              '${actionProvider.fontSize.floor()}'),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 18.0),
                        ),
                        child: Slider(
                          activeColor: hexToArgb('#494F59'),
                          value: actionProvider.fontSize,
                          min: 10.0,
                          max: 40.0,
                          onChanged: (newValue) {
                            actionProvider.changeFontSize(newValue);
                          },
                        ),
                      ),
                    ),
                    const Text(
                      'قەبارەی فۆنت',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'nizar'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: CustomSliderTextInsideThumbShape(
                              '${actionProvider.fontSizeOfTafseer.floor()}'),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 18.0),
                        ),
                        child: Slider(
                          activeColor: hexToArgb('#494F59'),
                          value: actionProvider.fontSizeOfTafseer,
                          min: 10.0,
                          max: 40.0,
                          onChanged: (newValue) {
                            actionProvider.changeFontSizeOfTafseer(newValue);
                          },
                        ),
                      ),
                    ),
                    const Text(
                      'قەبارەی فۆنتی تەفسیر',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'nizar',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      dropdownColor: hexToArgb('#494F59'),
                      underline: Container(),
                      borderRadius: BorderRadius.circular(12),
                      value: actionProvider.selectedFont,
                      items: actionProvider.dropdownFontOptions
                          .map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(
                            option,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'calibri',
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        actionProvider.changeFontFamily(newValue);
                      },
                    ),
                    const Text(
                      'فۆنت',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'nizar',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      dropdownColor: hexToArgb('#494F59'),
                      underline: Container(),
                      borderRadius: BorderRadius.circular(12),
                      value: actionProvider.selectedTafseerFont,
                      items: actionProvider.dropdownTafseerFontOptions
                          .map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(
                            option,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'calibri',
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        actionProvider.changeTafseerFontFamily(newValue);
                      },
                    ),
                    const Text(
                      'فۆنتی تەفسیر',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'nizar',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
