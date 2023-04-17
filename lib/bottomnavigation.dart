// ignore_for_file: camel_case_types
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:flutter/material.dart';
import 'page/home.dart';
import 'page/map.dart';
import 'page/mood.dart';
import 'page/setting.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int index = 0;
  final screens = [
    const HomePage(),
    const MoodPage(),
    const MapPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: buildMyNavBar(context),     
    );
  }

  Container buildMyNavBar(BuildContext context) {
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
                color: index == 0 ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  index = 0;
                });
              },
              icon: index == 0
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
                color: index == 1 ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
              icon: index == 1
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
                color: index == 2 ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  index = 2;
                });
              },
              icon: index == 2
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
                color: index == 3 ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  index = 3;
                });
              },
              icon: index == 3
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
