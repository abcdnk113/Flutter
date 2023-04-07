// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

void showSnackBar(context, message, color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
  ));
}

class MyRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String text;
  final ValueChanged<T?> onChanged;

  const MyRadioOption(
      {required this.value,
      required this.groupValue,
      required this.text,
      required this.onChanged,
      Key? key})
      : super(key: key);

  Widget _buildRadioOption() {
    final bool isSelected = value == groupValue;

    return isSelected
        ? const Iconify(MaterialSymbols.check_circle_rounded,
            color: Colors.greenAccent)
        : const Iconify(MaterialSymbols.check_circle_rounded,
            color: Colors.black12);
  }

  Widget _buildText() {
    return Text(
      text,
      style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8,right: 25,top: 8,bottom: 8),
      child: InkWell(
        onTap: () => onChanged(value),
        //splashColor: Colors.grey,
        child:
            Row(children: [_buildText(), const Spacer(), _buildRadioOption()]),
      ),
    );
  }
}
