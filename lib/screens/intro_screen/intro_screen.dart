import 'package:coast_link/screens/intro_screen/sign_up_container.dart';
import 'package:coast_link/screens/intro_screen/sign_up_screen/components/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/sliding_sheet.dart';
import '../../state_providers/home_state_provider.dart';
import '../../state_providers/intro_state_provider.dart';

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
    animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
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
        child: Consumer<IntroState>(
          builder: (context, algo, child) => PageView(
            controller: algo.pageController,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: const [IntroPage(), SignUpPage()],
          ),
        ));
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IntroState>(
      builder: (context, algo, child) => Stack(
        children: [
          Scaffold(
            /* bottomSheet: BottomSheet(
                      animationController: animController,
                      enableDrag: true,
                      onClosing: () {},
                      builder: ((context) => Container(
                          color: Colors.red,
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width))),*/
            backgroundColor: const Color.fromARGB(255, 244, 244, 244),
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
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Align(child: algo.titles[algo.currentIndex]),
                          ),
                        ],
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            algo.pageController.animateToPage(1,
                                duration: const Duration(seconds: 1),
                                curve: Curves.decelerate);
                          });
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
                              "Create Account",
                              style: TextStyle(fontSize: 80),
                            )))),
                      ),
                      TextButton(
                        onPressed: () {
                          /* showMaterialModalBottomSheet(shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),context: context, builder: (context)=>
                                 );
                                */
                          algo.panelState == PanelState.CLOSED
                              ? algo.panelActivate()
                              : algo.panelDeactivate();
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.black)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: const SizedBox(
                            height: 30,
                            width: 200,
                            child: Center(
                                child: FittedBox(
                                    child: Text(
                              "Sign In",
                              style: TextStyle(fontSize: 80),
                            )))),
                      ),
                                          GoogleSignInButton()

                    ]),
              ),
            ),
          ),
          SlidingUpPanel(
            controller: algo.panelController,
            panel: Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Column(
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Spacer(flex: 1,),
                        GestureDetector(
                            onTap: () => algo.panelDeactivate(),
                            child: const Icon(Icons.close)),
                            Spacer(flex: 25,),
                         Text(
                          "Welcome, back!",
                          style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.end,
                        ),
                        Spacer(flex: 50,)
                      ],
                    ),
                    Divider(thickness: 2,),
                    const Spacer(
                      flex: 2,
                    ),
                    const Spacer(flex: 10),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) =>
                          value!.contains("@student.cccd.edu") != true
                              ? "Email must end in @student.cccd.edu"
                              : null,
                      decoration: InputDecoration(
                        hintText: "Email",
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
                    const Spacer(
                      flex: 5,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if (value!.length < 6) {
                          return 'Password must be greater than 6 characters';
                        }
                        return null;
                      },
                      maxLines: 1,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
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
                    const Spacer(
                      flex: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        algo.auth.signInEmailPassword(
                            _emailController.text, _passwordController.text);

                        print("Sign IN");
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
                            "Sign In",
                            style: TextStyle(fontSize: 80),
                          )))),
                    ),
                    const Spacer(
                      flex: 100,
                    ),
                  ],
                ),
              ),
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            defaultPanelState: algo.panelState,
            snapPoint: .9,
            color: Colors.white,
            slideDirection: SlideDirection.UP,
            minHeight: 0,
            maxHeight: MediaQuery.of(context).size.height / 1.1,
            renderPanelSheet: true,
            isDraggable: false,
          )
        ],
      ),
    );
  }
}
