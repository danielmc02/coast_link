import 'package:coast_link/loading_screen.dart';
import 'package:coast_link/main.dart';
import 'package:coast_link/screens/home_screen/home_screen.dart';
import 'package:coast_link/services/authentication/authentication.dart';
import 'package:coast_link/state_providers/intro_state_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/intro_screen/intro_screen.dart';
import 'state_providers/home_state_provider.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
         providers: [
          ChangeNotifierProvider(create: (context) => IntroState()),
          ChangeNotifierProvider(create: (context) => HomeState())
        ],
      child: StreamBuilder<User?>(
          stream: _auth.getuser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.photoURL == null)
              {
                print("Screen Change");
                return LoadingScreen();
              }
              return const HomeScreen();
            } else {
              return const  LoadingScreen();//IntroScreen();
            }
          }),
    );
  }
}
