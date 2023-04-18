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

  TextEditingController passwordController = TextEditingController();

  changeVisiblity() {
    showPass = !showPass;
    notifyListeners();
  }
}

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

class MoodState extends ChangeNotifier {  
  int choiceIndex = 0;
  bool changeColor (int index){
    final changeColor = choiceIndex == index;
    return changeColor;
  }
  isSelected(bool selected,int index){
    if (selected){
      choiceIndex = index;
    }else{
      choiceIndex = 0;
    }
    notifyListeners();
  }
}
