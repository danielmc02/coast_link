import 'package:coast_link/screens/intro_screen/sign_up_screen/components/activity_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state_providers/intro_state_provider.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IntroState>(
      builder: (context, algo, child) => Scaffold(
          appBar: AppBar(leading: GestureDetector(onTap: () => algo.pageController.animateToPage(0, duration: const Duration(seconds: 1), curve: Curves.decelerate),child: const Icon(Icons.close, color: Colors.black,)),
            title: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: algo.formGlobalKey,
              child: PageView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                       FittedBox(child: Text("Choose some interests",style: Theme.of(context).textTheme.headline4,)),
                       FittedBox(child: Text(textAlign:TextAlign.center,"Used to group people with alike personalities.\nChoose no preference if you don't care who you match with",style: Theme.of(context).textTheme.subtitle2,)),
                      //TextButton( onPressed: () => algo.getCategories(),child: const Text("Click Me"))
                      Wrap(
                        direction: Axis.horizontal,

                        children: [ExtrovertedActivites(),IntrovertedActivites()],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                    FittedBox(child: Text("Choose some hobbies",style: Theme.of(context).textTheme.headline4,)),
                      Wrap(),
                      Container(color: Colors.red,height: 20,)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(
                        flex: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) =>
                              value!.contains("@student.cccd.edu") != true
                                  ? "Email must end in @student.cccd.edu"
                                  : null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value!.length < 6) {
                              return 'Password must be greater than 6 characters';
                            }
                            return null;
                          },
                          maxLines: 1,
                          controller: _passwordController,
                          obscureText: algo.obscureText,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    algo.changeText();
                                  });
                                },
                                child: algo.obscureText
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 10,
                      ),
                      TextButton(
                        onPressed: () async {
                          if (algo.formGlobalKey.currentState!.validate()) {
                            print(_emailController.text);
                            await algo.auth.signUpEmailPassword(
                                _emailController.text,
                                _passwordController.text);
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: const SizedBox(
                            height: 30,
                            width: 200,
                            child: Center(
                                child: FittedBox(
                                    child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 80),
                            )))),
                      ),
                      const Spacer(
                        flex: 2,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}