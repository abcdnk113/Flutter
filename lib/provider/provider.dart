import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:colorful_iconify_flutter/icons/twemoji.dart';

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

class MoodState extends ChangeNotifier {
  final _choices = [
    "very good  ",
    "okish  ",
    "very bad  ",
    "angry  ",
    "just sad for no reason  ",
    "I'm Very very happy  ",
    "Verry verry Terrible  "
  ];
  List get choices => _choices;
  final _iconTypes = [
    const Iconify(Twemoji.smiling_face_with_smiling_eyes), // widget
    const Iconify(Twemoji.expressionless_face),
    const Iconify(Twemoji.frowning_face),
    const Iconify(Twemoji.angry_face),
    const Iconify(Twemoji.confounded_face),
    const Iconify(Twemoji.smiling_face_with_heart_eyes),
    const Iconify(Twemoji.crying_face)
  ];
  List get iconTypes => _iconTypes;
  int? choiceIndex;
  int? index;
  int? isSelected  ;
  bool selected = true;
  chageSelected() {
    isSelected = (selected ? index : 0);
    notifyListeners();
  }
}
