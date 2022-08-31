import 'package:coast_link/state_providers/home_state_provider.dart';
import 'package:coast_link/state_providers/intro_state_provider.dart';
import 'package:coast_link/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;

  @override
  void initState() {
    animController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IntroState()),
        ChangeNotifierProvider(create: (context) => HomeState())
      ],
      child: 
            PageView(scrollDirection: Axis.vertical,children: [
              IntroPage(),
              SignUpPage()
            ],)
        );
      
    
  }
}


class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           /* bottomSheet: BottomSheet(
                animationController: animController,
                enableDrag: true,
                onClosing: () {},
                builder: ((context) => Container(
                    color: Colors.red,
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width))),*/
            backgroundColor: Color.fromARGB(244, 255, 255, 255),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                "Coastal Social",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /*AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                  textStyle: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  "Meet new people",
                                  speed: Duration(milliseconds: 150)),
                              TyperAnimatedText(
                                  textStyle: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  "Create public events",
                                  speed: Duration(milliseconds: 150)),
                              TyperAnimatedText(
                                  textStyle: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  "Find alike people",
                                  speed: Duration(milliseconds: 150)),
                              TyperAnimatedText(
                                  textStyle: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  "Expand your friend group",
                                  speed: Duration(milliseconds: 150)),
                            ],
                          ),*/
                        ],
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
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
                              "Create Account",
                              style: TextStyle(fontSize: 80),
                            )))),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showBottomSheet(context: context, builder: 
                          (context)=> 
                             Card(
                              child: Column(children: [Container(width: 50,height: 50,color: Colors.red,)]),
                            
                            ));
                          });
                          
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        child: const SizedBox(
                            height: 30,
                            width: 200,
                            child: Center(
                                child: FittedBox(
                                    child: Text(
                              "Sign In",
                              style: TextStyle(fontSize: 80),
                            )))),
                      )
                    ]),
              ),
            ),
          );
  }
}

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
      builder: (context, algo, child) => 
      Scaffold(
          appBar: AppBar(
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
              child: Column(
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
                            borderSide: const BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black)),
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
                            borderSide: const BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black)),
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
                            _emailController.text, _passwordController.text);
                      }
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
            ),
          )),
    );
  }
}
