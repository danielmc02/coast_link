import 'package:coast_link/state_providers/intro_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IntroState>(
      builder: (context, algo, child) =>  TextButton(
                        onPressed: () async{
                          await algo.auth.signInWithGoogle();
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        child: const SizedBox(
                            height: 30,
                            width: 200,
                            child: Center(
                                child: FittedBox(
                                    child: Text(
                              "Continue with Google",
                              style: TextStyle(fontSize: 80),
                            )))),
                      ),
    );
  }
}