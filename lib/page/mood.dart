import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:weather/components/widget.dart';
import '../model/weather.dart';
import '../network/request.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  late Future<WeatherClass> futureWeather;
  late List<String> _choices;
  late int _defaultChoiceIndex;
  late int index;
  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
    _defaultChoiceIndex = 0;
    _choices = [
      "very good 😊",
      "okish 😐",
      "very bad 🙁",
      "angry 😠",
      "just sad for no reason 😩",
      "I'm Very very happy 😍",
      "Verry verry Terrible"
    ];
  }

  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.black, Colors.transparent],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.8, 1.5],
    begin: Alignment.center,
    end: Alignment.bottomCenter,
  );

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
                  const Divider(
                    color: Colors.transparent,
                  ),
                  //wrap
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        _maskingGradient.createShader(bounds),
                    blendMode: BlendMode.dstIn,
                    child: SizedBox(
                      height: 400,
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 19,
                          runSpacing: 18,
                          children:
                              List<Widget>.generate(_choices.length, (index) {
                            return ChoiceChip(
                              label: Text(_choices[index],
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                              selected: _defaultChoiceIndex == index,
                              selectedColor:
                                  const Color.fromRGBO(41, 50, 60, 1),
                              onSelected: (bool selected) {
                                setState(() {
                                  _defaultChoiceIndex = (selected ? index : 0);
                                });
                              },
                              labelPadding: const EdgeInsets.only(
                                  top: 32, bottom: 32, left: 21, right: 21),
                              backgroundColor: Colors.white,
                              labelStyle: TextStyle(
                                  color: _defaultChoiceIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 15),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  side: BorderSide(
                                      color: Colors.black, width: 1)),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
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
                                    _choices[_defaultChoiceIndex],
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
                  const Spacer(
                    flex: 1,
                  )
                ])));
  }
}
