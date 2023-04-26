// ignore_for_file: camel_case_types
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/page/navigationpage/navigation_provider.dart';
import '../homepage/home.dart';
import '../moodpage/mood.dart';
import '../settingpage/setting.dart';
import 'package:weather/page/mappage/map.dart';

// ignore: must_be_immutable
class bottomNavigationBar extends StatelessWidget {
  bottomNavigationBar({super.key});   
  BottomNavigationBarProvider? screenState;  

  @override
  Widget build(BuildContext context) {
  final screens = [
    const HomePage(),
    const MoodPage(),
    const MapPage(),
    const SettingPage(),
  ];
    screenState = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: screens[screenState!.currentIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    screenState = Provider.of<BottomNavigationBarProvider>(context);
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 48,
            width: 64,
            decoration: BoxDecoration(
                color: screenState!.currentIndex == 0 ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                screenState!.currentIndex = 0;
              },
              icon: screenState!.currentIndex == 0
                  ? const Iconify(
                      MaterialSymbols.sunny_outline_rounded,
                      color: Colors.white,
                      size: 29,
                    )
                  : const Iconify(
                      MaterialSymbols.sunny_outline_rounded,
                      color: Colors.black,
                      size: 29,
                    ),
            ),
          ),
          Container(
            height: 48,
            width: 64,
            decoration: BoxDecoration(
                color: screenState!.currentIndex == 1 ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                screenState!.currentIndex = 1;
              },
              icon: screenState!.currentIndex == 1
                  ? const Iconify(
                      MaterialSymbols.cloud_outline,
                      color: Colors.white,
                      size: 29,
                    )
                  : const Iconify(
                      MaterialSymbols.cloud_outline,
                      color: Colors.black,
                      size: 29,
                    ),
            ),
          ),
          Container(
            height: 48,
            width: 64,
            decoration: BoxDecoration(
                color: screenState!.currentIndex == 2 ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                screenState!.currentIndex = 2;
              },
              icon: screenState!.currentIndex == 2
                  ? const Iconify(
                      MaterialSymbols.location_on_outline_rounded,
                      color: Colors.white,
                      size: 29,
                    )
                  : const Iconify(
                      MaterialSymbols.location_on_outline_rounded,
                      color: Colors.black,
                      size: 29,
                    ),
            ),
          ),
          Container(
            height: 48,
            width: 64,
            decoration: BoxDecoration(
                color: screenState!.currentIndex == 3 ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                screenState!.currentIndex = 3;
              },
              icon: screenState!.currentIndex == 3
                  ? const Iconify(
                      Ph.lightning_bold,
                      color: Colors.white,
                      size: 29,
                    )
                  : const Iconify(
                      Ph.lightning_bold,
                      color: Colors.black,
                      size: 29,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
