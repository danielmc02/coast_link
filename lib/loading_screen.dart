import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: AnimatedTextKit(repeatForever: true,animatedTexts: <AnimatedText>[
            FadeAnimatedText(
                textAlign: TextAlign.center,
                textStyle: Theme.of(context).textTheme.headline6,
                'Check your email to verify your account to access different features'),
            FadeAnimatedText(
                textAlign: TextAlign.center,
                textStyle: Theme.of(context).textTheme.headline6,
                "When meeting new people it's best to do so in groups"),
            FadeAnimatedText(
                textAlign: TextAlign.center,
                textStyle: Theme.of(context).textTheme.headline6,
                "Report any inappropriate activity or behavior"),
            FadeAnimatedText(
                textAlign: TextAlign.center,
                textStyle: Theme.of(context).textTheme.headline6,
                "Your friends will be notified of your recent activity when linking with a groupd or person"),
            FadeAnimatedText(
                textAlign: TextAlign.center,
                textStyle: Theme.of(context).textTheme.headline6,
                "Refer to our safety measures automatically taken to establish a minimum safety measure")
          ])),
          CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
