import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  bool showPass = false;

  TextEditingController passwordController = TextEditingController();

  changeVisiblity() {
    showPass = !showPass;
    notifyListeners();
  }
}

