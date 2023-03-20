import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'home.dart';
import 'map.dart';
import 'mood.dart';
import 'setting.dart';


class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int index = 0;
  final screens = [
    HomePage(),
    MoodPage(),
    MapPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Colors.black45,
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 60,
          backgroundColor: Colors.white,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(()=> this.index = index),
          animationDuration: const Duration(seconds: 3),
          destinations: const[
            NavigationDestination(
              icon: Iconify(MaterialSymbols.sunny_outline_rounded),
              label: 'Home',),
            NavigationDestination(
              icon: Iconify(MaterialSymbols.cloud_outline) ,
              label: 'Mood',),
            NavigationDestination(
              icon: Iconify(MaterialSymbols.location_on_outline_rounded),
              label: 'Maps',),
            NavigationDestination(
              icon: Iconify(Ph.lightning_bold) ,
              label: 'Setting',)
          ]),
      ),
    );
  }
}