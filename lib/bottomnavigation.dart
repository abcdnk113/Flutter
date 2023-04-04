// ignore_for_file: camel_case_types
// import 'package:iconify_flutter/icons/material_symbols.dart';
// import 'package:iconify_flutter/iconify_flutter.dart';
// import 'package:iconify_flutter/icons/ph.dart';

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
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
      // bottomNavigationBar: NavigationBarTheme(
      //   data:const NavigationBarThemeData(
      //     indicatorColor: Colors.black,  
      //     indicatorShape:       
      //   ),
      //   child: NavigationBar(
      //     labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      //     height: 60,
      //     backgroundColor: Colors.blue,
      //     selectedIndex: index,
      //     onDestinationSelected: (index) => setState(()=> this.index = index),
      //     animationDuration: const Duration(seconds: 3),
      //     destinations: const[
      //       NavigationDestination(
      //         icon: Iconify(MaterialSymbols.sunny_outline_rounded,),
      //         selectedIcon: Iconify(MaterialSymbols.sunny_outline_rounded,color: Colors.white,),
      //         label: 'Home',),
      //       NavigationDestination(
      //         icon: Iconify(MaterialSymbols.cloud_outline) ,
      //         selectedIcon: Iconify(MaterialSymbols.cloud_outline,color: Colors.white,) ,
      //         label: 'Mood',),
      //       NavigationDestination(
      //         icon: Iconify(MaterialSymbols.location_on_outline_rounded),
      //         label: 'Maps',
      //         selectedIcon: Iconify(MaterialSymbols.location_on_outline_rounded,color: Colors.white,),
      //         ),
      //       NavigationDestination(
      //         icon: Iconify(Ph.lightning_bold) ,
      //         label: 'Setting',
      //         selectedIcon: Iconify(Ph.lightning_bold,color: Colors.white,))
      //     ]
      //   ),
      // ),
      bottomNavigationBar: FloatingNavbar(   
        iconSize: 24,  
        width: double.infinity-20,
        itemBorderRadius: 16,
        backgroundColor: Colors.transparent,
        selectedBackgroundColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        currentIndex: index,
        items: [
          FloatingNavbarItem(
            icon: Icons.wb_sunny_outlined
          ),
          FloatingNavbarItem(
            icon: Icons.cloud_outlined
          ),
          FloatingNavbarItem(
            icon: Icons.location_on_outlined
          ),
          FloatingNavbarItem(
            icon: Icons.flash_on_outlined
          ),
        ],
      ),
    );
  }
}
