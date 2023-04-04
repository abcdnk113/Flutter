// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

void showSnackBar(context, message, color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
  ));
}

class ListMood extends StatefulWidget {
  const ListMood({super.key});

  @override
  State<ListMood> createState() => _ListMoodState();
}

class _ListMoodState extends State<ListMood> {
  late List<String> _choices;
  late int _defaultChoiceIndex;
  @override
  void initState() {
    super.initState();
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
    stops: [0.6, 1.5],
    begin: Alignment.center,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      blendMode: BlendMode.dstIn,
      child: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 19,
            runSpacing: 18,
            children: List<Widget>.generate(_choices.length, (int index) {
              return ChoiceChip(
                label: Text(_choices[index]),
                selected: _defaultChoiceIndex == index,
                selectedColor: const Color.fromRGBO(41, 50, 60, 1),
                onSelected: (bool selected) {
                  setState(() {
                    _defaultChoiceIndex = (selected ? index : 0);
                  });
                },
                labelPadding:
                    const EdgeInsets.only(top: 32, bottom: 32, left: 21, right: 21),
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                    color:
                        _defaultChoiceIndex == index ? Colors.white : Colors.black,
                    fontSize: 15),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    side: BorderSide(color: Colors.black, width: 1)),
              );
            }),
          ),
        ),
      ),
    );
  }
}
