import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  bool showPass = false;
  bool isPassValidate = true;
  bool isEmailValidate = true;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool validateEmail(String value) {
  if(value.isEmpty){
    return false;
  }  
  return true;
  }
  changeVisiblity() {
    showPass = !showPass;
    notifyListeners();
  }
  changePassValidate (){
    if (passwordController.text.length < 6){
      isPassValidate = false;
    }else {
      isPassValidate = true;
    }
    notifyListeners();
  }
  
  changeEmailValidate (){
    isEmailValidate = validateEmail(emailController.text);
    notifyListeners();
  }
}
