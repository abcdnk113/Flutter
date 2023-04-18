import 'package:flutter/material.dart';

class SignupState extends ChangeNotifier {
  bool showPass = false;
  bool showRePass = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController repassController = TextEditingController();

  changePass() {
    showPass = !showPass;
    notifyListeners();
  }

  changeRePass() {
    showRePass = !showRePass;
    notifyListeners();
  }  
}