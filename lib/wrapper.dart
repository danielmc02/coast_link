import 'package:coast_link/main.dart';
import 'package:coast_link/screens/home_screen/home_screen.dart';
import 'package:coast_link/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: _auth.getuser(),builder: (context, snapshot) {
      if(snapshot.hasData)
      {
        return const HomeScreen();
      }
      else{
        return const IntroScreen();
      }
      
    } );
  }
}