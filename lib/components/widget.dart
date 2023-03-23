

import 'package:flutter/material.dart';

void showSnackBar (context,message ,color){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),
  behavior: SnackBarBehavior.floating,
  backgroundColor: color,));}