
import 'package:flutter/material.dart';

class IntroState extends ChangeNotifier
{

  bool obscureText = true;

  void changeText()
  {
    obscureText = !obscureText;
    notifyListeners();
  }
  
}