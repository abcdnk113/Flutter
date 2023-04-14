import 'package:flutter/material.dart';

// class User extends ChangeNotifier {
//   String email = "";
//   String pwd = "";

//   void signIn(String email, String pwd) {
//     email = email;
//     pwd = pwd;
//     notifyListeners();
//   }
// }

class LoginState extends ChangeNotifier {
  bool showPass = false;
  String _string = "";
  String get string => _string;

  TextEditingController passwordController = TextEditingController();

  changeVisiblity() {
    showPass = !showPass;
    notifyListeners();
  }

  inputPassword(String str) {
    _string = str;
    notifyListeners();
  }
}

class SignupState extends ChangeNotifier {
  bool showPass = false;
  bool showRePass = false;
  String _string = "";
  String get string => _string;

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

  inputPassword(String str) {
    _string = str;
    notifyListeners();
  }
}
