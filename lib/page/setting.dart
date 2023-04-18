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
import 'package:weather/components/widget.dart';
import 'erpage.dart';

enum Temprature { Celsius, Fahrenheit }

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Temprature? _temp = Temprature.Celsius;

  @override
  Widget build(BuildContext context) {
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
                  buildRow(Ci.user, "Account", Carbon.notification_off,
                      Colors.white),
                  const SizedBox(height: 20),
                  buildRow(MaterialSymbols.location_on_outline_rounded,
                      "Location", Carbon.notification_off, Colors.white),
                  const SizedBox(height: 20),
                  buildRow(Carbon.notification, "Notifications",
                      Carbon.notification_off, Colors.red),
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
              child: Column(
                children: [
                  // RadioListTile<Temprature>(
                  //   controlAffinity: ListTileControlAffinity.trailing,
                  //   title: const Text("Celsius"),
                  //   value: Temprature.Celsius,
                  //   groupValue: _temp,
                  //   onChanged: (Temprature? value) {
                  //     setState(() {
                  //       _temp = value;
                  //     });
                  //   },
                  // ),
                  // RadioListTile<Temprature>(
                  //   controlAffinity: ListTileControlAffinity.trailing,
                  //   title: const Text("Fahrenheit"),
                  //   value: Temprature.Fahrenheit,
                  //   groupValue: _temp,
                  //   onChanged: (Temprature? value) {
                  //     setState(() {
                  //       _temp = value;
                  //     });
                  //   },
                  // ),
                  const SizedBox(height: 10),
                  MyRadioOption(
                    value: Temprature.Celsius,
                    text: "Celsius",
                    groupValue: _temp,
                    onChanged: (Temprature? value) {
                      setState(
                        () {
                          _temp = value;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyRadioOption(
                    value: Temprature.Fahrenheit,
                    text: "Fahrenheit",
                    groupValue: _temp,
                    onChanged: (Temprature? value) {
                      setState(() {
                        _temp = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
          size: 14,
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
