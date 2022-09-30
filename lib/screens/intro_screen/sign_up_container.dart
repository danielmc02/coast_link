import 'package:coast_link/screens/intro_screen/sign_up_screen/components/activity_card.dart';
import 'package:coast_link/screens/intro_screen/sign_up_screen/components/extroverted_chips.dart';
import 'package:flutter/cupertino.dart';
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
    late TextEditingController _nameController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IntroState>(
      builder: (context, algo, child) => Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () => algo.pageController.animateToPage(0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate),
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                )),
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
                      FittedBox(
                          child: Text(
                        "Choose some interests",
                        style: Theme.of(context).textTheme.headline4,
                      )),
                      FittedBox(
                          child: Text(
                        textAlign: TextAlign.center,
                        "Used to group people with alike personalities.\nChoose no preference if you don't care who you match with",
                        style: Theme.of(context).textTheme.subtitle2,
                      )),
                      //TextButton( onPressed: () => algo.getCategories(),child: const Text("Click Me"))
                      Expanded(
                        child: Center(
                          child: Wrap(
                            direction: Axis.horizontal,
                            runSpacing: 100,
                            children: [
                              ExtrovertedActivites(),
                              CupertinoSwitch(value: true, onChanged:(bool){} ),
                              IntrovertedActivites()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FittedBox(
                          child: Text(
                        algo.ExtrovertedActivitesCard
                            ? "Choose some hobbies"
                            : algo.IntrovertedActivitesCard
                                ? "Choose some hobbies"
                                : "None were chosen",
                        style: Theme.of(context).textTheme.headline4,
                      )),
                      if (algo.ExtrovertedActivitesCard)
                        Text("Extroverted chips")
                      else if (algo.IntrovertedActivitesCard)
                        Text("Introverted chips")
                      else
                        Text("None Was Chosen"),
                      Expanded(
                          child: SingleChildScrollView(
                              child: algo.ExtrovertedActivitesCard
                                  ? ExtrovertedChips()
                                  : algo.IntrovertedActivitesCard
                                      ? IntrovertedChips()
                                      : Text("error"))),
                      //children: [Flexible(child: algo.wrapedChips())],
                    ],
                  ),
                  Scaffold(
                    body: SingleChildScrollView(
                      physics: PageScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FittedBox(
                            child: Text(
                              'Complete your profile',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                          FittedBox(
                              child: Text(
                            textAlign: TextAlign.center,
                            "Add a profile photo, name and bio to let people know who you are",
                            style: Theme.of(context).textTheme.subtitle2,
                          )),
                          //  Spacer(),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              //print("object");

                              algo.chooseImage();
                            },
                            child: ClipOval(
                              child: algo.broadImage != null
                                  ? Image.file(
                                      algo.broadImage!,
                                      width: 180,
                                      height: 180,
                                      fit: BoxFit.cover,
                                      scale: 1,
                                    )
                                  : const ClipOval(
                                      child: CircleAvatar(
                                          minRadius: 80,
                                          backgroundColor: Colors.grey,
                                          child: Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 115, 115, 115),
                                            size: 90,
                                          ))),
                            ),
                          )
                          /*
                             Align(
                              
                                alignment: Alignment.center,
                                child: SizedBox(
                                  child: CircleAvatar(
                                    radius: 40.0+30,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.yellow,
                                      foregroundColor: Colors.yellow,
                                      backgroundImage: algo.broadImage == null ? AssetImage('assets/emoji_faces_smilling-in-clouds.png') :;
                                      radius: 38.0+30,
                                      child:  Align(
                                        alignment: Alignment.topRight,
                                        child: CircleAvatar(
                                          
                                          backgroundColor: Theme.of(context).colorScheme.secondary,
                                          radius: 12.0+15,
                                          child: Icon(
                                            Icons.camera_alt,
                                            size: 15.0+15,
                                            color: Color(0xFF404040),
                                          ),
                                        ),
                                      ),
                                     
                                    ),
                                  ),
                                ),
                              ),*/
                          // , const Spacer(
                          // flex: 10,
                          //),
                       ,  SizedBox(height: 20,) , SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: TextFormField(maxLength: 20,
                              controller: _nameController,
                              validator: (value) => value!.length <= 0
                                  ? "Name can not be empty"
                                  : null,
                              decoration: InputDecoration(
                                hintText: "Enter your name",

                                fillColor: Colors.grey[200],
                                // filled: true,
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
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: TextFormField(
                              controller: _emailController,
                              validator: (value) => value!.length <= 0
                                  ? "Email can not be empty"
                                  : null,
                              decoration: InputDecoration(
                                hintText: "Email",

                                fillColor: Colors.grey[200],
                                // filled: true,
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
                          SizedBox(
                            height: 10,
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
                                hintText: "Password",
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
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () async {
                              if (algo.formGlobalKey.currentState!.validate()) {
                                if(algo.createAccount())
                                {
                                  try
                                  {
                                   await algo.triggerAuth(
                                    _emailController.text,
                                    _passwordController.text, algo.broadImage, _nameController.text);
                                  }
                                  catch(e)
                                  {
                                    print(e);
                                  }

                                }
                                else
                                {
                                  print('pick niche');
                                }


                               // await algo.auth.signUpEmailPassword(
                                //    _emailController.text,
                                 //   _passwordController.text);
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
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

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
