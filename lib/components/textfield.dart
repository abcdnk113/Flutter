import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 16),
      validator: (val) => val!.isEmpty ? 'Not Value' : null,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.send,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(18)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(18)
          ),
          border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400,),
          borderRadius: BorderRadius.circular(15.0),
        ),          
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500],fontSize: 16)
      ),
    );
  }
}

// ignore: must_be_immutable
class MyPasswordTextField extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  bool obscureText = false;
  MyPasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
  });

  @override
  State<MyPasswordTextField> createState() => _MyPasswordTextFieldState();
}

class _MyPasswordTextFieldState extends State<MyPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 16),
      validator: (val) => val!.isEmpty ? 'Not Value' : null,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.send,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          suffixIcon: InkWell(
          onTap: () {
            setState(() {
              widget.obscureText = !widget.obscureText;
            });
          },          
          child: !widget.obscureText
            ? const Icon(Icons.visibility, color: Colors.black,)
            : const Icon(Icons.visibility_off, color: Colors.black,)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(18)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(18)
          ),
          
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500],fontSize: 16
        )
      ),
    );
  }
}
