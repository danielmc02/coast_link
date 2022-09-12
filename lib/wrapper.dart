import 'package:coast_link/main.dart';
import 'package:coast_link/screens/home_screen/home_screen.dart';
import 'package:coast_link/services/authentication/authentication.dart';
import 'package:flutter/material.dart';

import 'screens/intro_screen/intro_screen.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _auth.getuser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const IntroScreen();
          }
        });
  }
}
