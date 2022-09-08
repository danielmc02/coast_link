import 'package:coast_link/components/sliding_sheet.dart';
import 'package:coast_link/state_providers/home_state_provider.dart';
import 'package:coast_link/state_providers/intro_state_provider.dart';
import 'package:coast_link/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        textTheme:  TextTheme(
          headline1: GoogleFonts.oswald(fontStyle: FontStyle.normal,fontSize: 96,fontWeight: FontWeight.w300),
          headline2: GoogleFonts.oswald(fontStyle: FontStyle.normal,fontSize: 60,fontWeight: FontWeight.w300),
          headline3: GoogleFonts.oswald(fontStyle: FontStyle.normal,fontSize: 48,fontWeight: FontWeight.w400),
          headline4: GoogleFonts.oswald(fontStyle: FontStyle.normal,fontSize: 34,fontWeight: FontWeight.w400),
          headline5: GoogleFonts.oswald(fontStyle: FontStyle.normal,fontSize: 24,fontWeight: FontWeight.w400,),
          headline6: GoogleFonts.oswald(fontStyle: FontStyle.normal,fontSize: 20,fontWeight: FontWeight.w500),
          subtitle1: GoogleFonts.oswald(fontStyle: FontStyle.normal,fontSize: 16,fontWeight: FontWeight.w400),
          subtitle2: GoogleFonts.oswald(fontStyle: FontStyle.normal,fontSize: 14,fontWeight: FontWeight.w500),
          bodyText1: GoogleFonts.oswald(fontStyle: FontStyle.normal,fontSize: 26,fontWeight: FontWeight.w300)
          //TextStyle(fontSize: 16,fontWeight: FontWeight.w300, fontFamily: GoogleFonts.oswald(),color: Theme.of(context).colorScheme.onPrimary),

        ),
        colorScheme: ColorScheme(brightness: Brightness.light, primary: Color.fromARGB(255, 97, 215, 0), onPrimary: Colors.black, secondary: Color.fromARGB(255, 0, 140, 255), onSecondary: Colors.white30, error: Colors.red, onError: Colors.blue, background: Color.fromARGB(255,  244, 244, 244), onBackground: Colors.black, surface: Colors.grey, onSurface: Colors.black26) ,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Wrapper(),
    );
  }
}
