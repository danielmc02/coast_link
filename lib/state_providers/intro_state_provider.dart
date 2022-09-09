import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coast_link/screens/intro_screen/sign_up_screen/components/activity_card.dart';
import 'package:coast_link/services/authentication.dart';
import 'package:coast_link/services/database/firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coast_link/components/sliding_sheet.dart';

class IntroState extends ChangeNotifier{
  final FireCloudServices db = FireCloudServices();
  PanelController panelController = PanelController();
  PageController pageController = PageController();
  void panelActivate() {
    panelController.open();
    panelState = PanelState.OPEN;
    notifyListeners();
  }

  void panelDeactivate() {
    panelController.close();
    panelState = PanelState.CLOSED;
    notifyListeners();
  }

  PanelState panelState = PanelState.CLOSED;
  void getCategories() {
    {
      //db.getExtrovertedHobbies();
    }
  }

  final AuthServices auth = AuthServices();
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  bool obscureText = true;

  void changeText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  int currentIndex = 0;

  List<Widget> titles = [const FirstTitle(), const SecondTitle()];
  void changeIndex() {
    currentIndex = 1;
    notifyListeners();
  }







  static List<bool> extrovertedHobbiesState = List.filled(extrovertedHobbies.length, false);
  // Beggining of Sign Up States
  static List<String> extrovertedHobbies = [
    'Amusement Parks',
    'Concerts',
    'Socializing',
    'Sports',
    'Road Trips',
    'Cars',
    'Bowling',
    'Fighting'
  ];
  List<String> introvertedHobbies = [
    'Gaming',
    'Photography',
    'Drawing',
    'Blogging',
    'Writing',
    'Cooking',
    'Gardening',
    'DIY',
    'Meditation',
    'Art'
  ];



  bool ExtrovertedActivitesCard = false;
  bool IntrovertedActivitesCard = false;

  void choseExtroverted() {
    ExtrovertedActivitesCard = true;
    IntrovertedActivitesCard = false;
    notifyListeners();
  }

  void choseIntroverted() {
    IntrovertedActivitesCard = true;
    ExtrovertedActivitesCard = false;
    notifyListeners();
  }
  


}

class FirstTitle extends StatefulWidget {
  const FirstTitle({super.key});

  @override
  State<FirstTitle> createState() => _FirstTitleState();
}

class _FirstTitleState extends State<FirstTitle> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IntroState>(
      builder: (context, algo, child) => AnimatedTextKit(
        onFinished: () => algo.changeIndex(),
        repeatForever: false,
        isRepeatingAnimation: false,
        animatedTexts: [
          RotateAnimatedText(
            textAlign: TextAlign.center,
            textStyle: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
            "Try new things",
            //speed: Duration(milliseconds: 150)
          ),
          RotateAnimatedText(
            textAlign: TextAlign.center,
            textStyle: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
            "Meet new people",
            //speed: Duration(milliseconds: 150)
          ),
          RotateAnimatedText(
            textAlign: TextAlign.center,
            textStyle: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
            "Create public events",
            // speed: Duration(milliseconds: 150)
          ),
          RotateAnimatedText(
            textAlign: TextAlign.center,
            textStyle: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
            "Expand your friend group",
            //speed: Duration(milliseconds: 150)
          ),
/*            
                                          ColorizeAnimatedText(textAlign: TextAlign.center,"Costal Social",
                                          speed: const Duration(seconds: 1),
                                          textStyle: const TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w600,
                                          ), colors: <Color>[Colors.red,Colors.blue,Colors.purple,Colors.red,Colors.blue,Colors.purple,])*/
        ],
      ),
    );
  }
}

class SecondTitle extends StatefulWidget {
  const SecondTitle({super.key});

  @override
  State<SecondTitle> createState() => _SecondTitleState();
}

class _SecondTitleState extends State<SecondTitle> {
  @override
  Widget build(BuildContext context) {
    return ColorizeAnimatedTextKit(
      repeatForever: false,
      isRepeatingAnimation: false,
      text: const ["Costal Social"],
      colors: const [Colors.red, Colors.blue, Colors.red, Colors.red],
      textStyle: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}


