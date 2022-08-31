
import 'package:coast_link/services/authentication.dart';
import 'package:flutter/material.dart';

class IntroState extends ChangeNotifier
{
  final AuthServices auth = AuthServices();
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  bool obscureText = true;

  void changeText()
  {
    obscureText = !obscureText;
    notifyListeners();
  }


  
}