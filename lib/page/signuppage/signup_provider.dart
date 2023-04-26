import 'package:flutter/material.dart';

class SignupState extends ChangeNotifier {
  bool showPass = false;
  bool showRePass = false;
  bool isPassValidate = true;
  bool isEmailValidate = true;
  bool isRePassValidate = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validateEmail(String value) {
  if(value.isEmpty){
    return false;
  }  
  return true;
  }
  changePass() {
    showPass = !showPass;
    notifyListeners();
  }
  changeRePass() {
    showRePass = !showRePass;
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
  changeRePassValidate (){
    if (repassController.text.length < 6){
      isRePassValidate = false;
    }else {
      isRePassValidate = true;
    }
    notifyListeners();
  } 
  changeEmailValidate (){
    isEmailValidate = validateEmail(emailController.text);
    notifyListeners();
  }  
}


