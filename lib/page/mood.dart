import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import '../model/weather.dart';
import '../network/request.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  late Future<WeatherClass> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            padding:
                EdgeInsets.symmetric(vertical: w * .12, horizontal: h * .04),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'images/avatar.png',
                          width: 38,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Britney Glayers',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                          Row(
                            children: [
                              Text(
                                'New York-USA',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              const Iconify(
                                  MaterialSymbols.keyboard_arrow_down_rounded)
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      const Iconify(
                        MaterialSymbols.dashboard_outline,
                        size: 32,
                        color: Colors.black54,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Text(
                    'How You feel Today ?',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 24),
                  ),                  
                  Center(
                    child: FutureBuilder<WeatherClass>(
                      future: futureWeather,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Today's Weather",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    snapshot.data!.weather![0].main!.toString(),
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Address",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    snapshot.data!.name.toString(),
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ]
              )
            )
          );
  }
}
