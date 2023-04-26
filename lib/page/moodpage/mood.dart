import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:colorful_iconify_flutter/icons/twemoji.dart';
import 'package:provider/provider.dart';
import 'package:weather/page/moodpage/mood_provider.dart';
import '../../model/weather.dart';
import '../../network/request.dart';
import 'package:weather/components/recase.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  late Future<WeatherClass> futureWeather;
  late List<String> _choices;
  late int index;
  late List<Widget> _iconTypes;
  late MoodState moodState = Provider.of<MoodState>(context);
  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
    _choices = [
      "very good  ",
      "okish  ",
      "very bad  ",
      "angry  ",
      "just sad for no reason  ",
      "I'm Very very happy  ",
      "Verry verry Terrible  "
    ];
    _iconTypes = [
      const Iconify(Twemoji.smiling_face_with_smiling_eyes), // widget
      const Iconify(Twemoji.expressionless_face),
      const Iconify(Twemoji.frowning_face),
      const Iconify(Twemoji.angry_face),
      const Iconify(Twemoji.confounded_face),
      const Iconify(Twemoji.smiling_face_with_heart_eyes),
      const Iconify(Twemoji.crying_face)
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
        padding: EdgeInsets.symmetric(vertical: w * .12, horizontal: h * .04),
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
                  Majesticons.dashboard_line,
                  size: 32,
                  color: Colors.black54,
                )
              ],
            ),
            const SizedBox(height: 44),
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
              shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
              blendMode: BlendMode.dstIn,
              child: SizedBox(
                height: 400,
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 19,
                    runSpacing: 18,
                    children: List<Widget>.generate(
                      _choices.length,
                      (index) {
                        return ChoiceChip(
                          label: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  color: moodState.changeState(index)
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 15),
                              text: _choices[index],
                              children: [WidgetSpan(child: _iconTypes[index])],
                            ),
                          ),
                          //Text(_choices[index],   ),
                          selected: moodState.changeState(index),
                          selectedColor: const Color.fromRGBO(41, 50, 60, 1),
                          onSelected: (bool selected) {
                            moodState.isSelected(selected, index);
                          },
                          labelPadding: const EdgeInsets.only(
                              top: 32, bottom: 32, left: 21, right: 21),
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Mood",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    Text(
                      _choices[moodState.choiceIndex].titleCase,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tomorrow's Mood",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    Text(
                      _choices[Random().nextInt(7)].titleCase,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
