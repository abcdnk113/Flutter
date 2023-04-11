import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String email = "";
  String pwd = "" ;
  

void signIn(String email, String pwd){
  email = email;
  pwd = pwd ;
  notifyListeners();
}
}