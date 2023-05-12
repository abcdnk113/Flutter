import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum Temprature { Celsius, Fahrenheit }
class TempratureProvider with ChangeNotifier {
  Temprature _temprature = Temprature.Celsius;
  Temprature get temprature => _temprature;

  set temprature(value){
    _temprature = value;
    notifyListeners();
  }  
}
class TopicSubscriptionModel extends ChangeNotifier {
  bool _isSubscribed = false;

  bool get isSubscribed => _isSubscribed;

  Future<void> toggleSubscription() async {
    if (_isSubscribed) {
      // Unsubscribe from the 'news' topic
      await FirebaseMessaging.instance.unsubscribeFromTopic('mess');
      await FirebaseMessaging.instance.deleteToken();
      print("Da tat thong bao");

    } else {
      // Subscribe to the 'news' topic
      await FirebaseMessaging.instance.subscribeToTopic('mess');
      await FirebaseMessaging.instance.getToken();
      print("Da bat thong bao");
    }
    _isSubscribed = !_isSubscribed;
    notifyListeners();
  }
}
  
