import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coast_link/state_providers/home_state_provider.dart';

import '../../state_providers/intro_state_provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeState(),
      child: Consumer<HomeState>(
        builder: ((context, algo, child) => 
        Scaffold(
          appBar: AppBar(
            title: Text("HOME SCREEN"),
          ),
          bottomNavigationBar: BottomNavigationBar(onTap: (value) {
            setState(() {
                          switch(value)
            {
              case 0:
              algo.index = 0;
              break;
              case 1:
              algo.index = 1;

              break;
              case 2:
                            algo.index = 2;

              break;
            }
            });

          },currentIndex: algo.index,items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
          ]),
          body: algo.pages[algo.index],
        )
      )),
    );
  }
}
