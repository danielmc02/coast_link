

import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier
{

  int index = 2;
  
   List<Widget> pages = [TBApage(),MapPage(),ProfilePage()];
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(color: Colors.green,child: const Center(child: Text("Profile Page")),),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Scaffold(

      body: Container(color: Colors.purple,child : const Center(child: Text("Map Page")),),
    );
  }
}


class TBApage extends StatelessWidget {
  const TBApage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Scaffold(

      body: Container(color: Colors.blue,child: const Center(child: Text("T.B.A Page")),),
    );
  }
}