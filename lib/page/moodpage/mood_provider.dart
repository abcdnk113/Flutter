import 'package:flutter/material.dart';

class MoodState extends ChangeNotifier {  
  int choiceIndex = 0;
  bool changeState (int index){
    final changeState = choiceIndex == index;
    return changeState;
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
