import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum Temprature { Celsius, Fahrenheit }
class TempratureProvider with ChangeNotifier {
  Temprature _temprature = Temprature.Celsius;
  bool tap = false;
  Temprature get temprature => _temprature;

  set temprature(value){
    _temprature = value;
    notifyListeners();
  }

  changeState() {
    tap = !tap;
    notifyListeners();
  }
}
  
