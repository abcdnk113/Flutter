import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;  
  Function onChanged;
  
  MyTextField({
    super.key,    
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value!);
        if (value.isEmpty) {
          return "Enter Email";
        } else if (!emailValid) {
          return "Enter valid Email";
        }
        return null;
      },
      onChanged: (text) => {
        onChanged()
      },
      style: GoogleFonts.poppins(fontSize: 16),
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      obscureText: false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(18),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(color: Colors.grey[500], fontSize: 16),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyPasswordTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  bool obscureText;
  Function onTap;  
  Function onTav;
  Function onChanged;
  MyPasswordTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.onChanged,
      required this.onTav,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Password";
        } else if (value.length < 6) {
          return "Password not length";
        }
        return null;
      },
      style: GoogleFonts.poppins(fontSize: 16),
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.send,
      obscureText: !obscureText,
      onChanged: (text) => {
        onChanged()
      },
      onTap: () {
        onTav();
      },
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: InkWell(
          onTap: () => { onTap() },
          child: !obscureText
              ? const Icon(
                  Icons.visibility_off,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.visibility,
                  color: Colors.black,
                ),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(18)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(18)),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintStyle: GoogleFonts.poppins(
          color: Colors.grey[500],
          fontSize: 16,
        ),
      ),
    );
  }
}
