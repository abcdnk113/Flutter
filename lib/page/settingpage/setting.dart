import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:iconify_flutter/icons/gg.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mingcute.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:provider/provider.dart';
import 'package:weather/components/widget.dart';
import 'package:weather/page/detailpage/detail.dart';
import 'package:weather/page/navigationpage/navigation_provider.dart';
import 'package:weather/page/settingpage/setting_provider.dart';
import '../errpage/erpage.dart';

// ignore: must_be_immutable
class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  BottomNavigationBarProvider? screenState;
  TempratureProvider? settingState;
  TopicSubscriptionModel? messState;
  @override
  Widget build(BuildContext context) {
    screenState = Provider.of<BottomNavigationBarProvider>(context);
    settingState = Provider.of<TempratureProvider>(context);
    messState = Provider.of<TopicSubscriptionModel>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        //color: Colors.blueGrey,
        padding: EdgeInsets.symmetric(vertical: w * .10, horizontal: h * .03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ErrPage(),
                      ),
                    );
                  },
                ),
                const Spacer(),
                const Iconify(
                  Majesticons.dashboard_line,
                  size: 32,
                  color: Colors.black87,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: h * .02),
              child: Text(
                "General Settings",
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [                  
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => const DetailPage())));
                    },
                    child: Row(
                      children: [
                        const Iconify(
                          Ci.user,
                          size: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "Account",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.black),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      screenState?.currentIndex = 2;
                    },
                    child: Row(
                      children: [
                        const Iconify(
                          MaterialSymbols.location_on_outline_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "Location",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.black),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      messState?.toggleSubscription();
                    },
                    child: Row(
                      children: [
                        const Iconify(
                          Carbon.notification,
                          size: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "Notifications",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.black),
                        ),
                        const Spacer(flex: 5),
                        Iconify( messState!.isSubscribed
                          ? Carbon.notification
                          : Carbon.notification_off,
                          size: 20,
                          color: messState!.isSubscribed
                          ? Colors.green
                          : Colors.red,
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: h * .02),
              child: Text(
                "Temprature",
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Consumer<TempratureProvider>(
                builder: (context, temp, child) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      MyRadioOption<Temprature>(
                        value: Temprature.Celsius,
                        text: "Celsius",
                        groupValue: temp.temprature,
                        onChanged: (Temprature? value) {
                          temp.temprature = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      MyRadioOption<Temprature>(
                        value: Temprature.Fahrenheit,
                        text: "Fahrenheit",
                        groupValue: temp.temprature,
                        onChanged: (Temprature? value) {
                          temp.temprature = value;
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                children: [
                  buildRow(Gg.notes, "terms and services",
                      Carbon.notification_off, Colors.white),
                  const SizedBox(height: 20),
                  buildRow(Ion.ios_information_circle_outline, "About",
                      Carbon.notification_off, Colors.white),
                  const SizedBox(height: 20),
                  buildRow(Ph.bug_beetle_thin, "Report buggy buggys",
                      Mingcute.bug_line, Colors.white),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRow(String icon, tittle, String icon1, color) {
    return Row(
      children: [
        Iconify(
          icon,
          size: 20,
          color: Colors.black,
        ),
        const SizedBox(width: 15),
        Text(
          tittle,
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
        ),
        const Spacer(flex: 5),
        Iconify(
          icon1,
          size: 14,
          color: color,
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
