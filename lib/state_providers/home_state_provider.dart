
import 'package:flutter_map/flutter_map.dart';
import 'package:coast_link/services/authentication.dart';
import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier
{
  AuthServices auth = AuthServices();
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

      body: Stack(
        children: [
          FlutterMap(layers: [
            TileLayerOptions(
              urlTemplate: "http://mt0.google.com/vt/lyrs=y&hl=en&x={x}&y={y}&z={z}&s=Ga",
maxZoom: 50
            )
          ],options: MapOptions(
            
          )),
       Container(color: Color.fromARGB(79, 0, 0, 0),
       child: Column(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,children: [
        FittedBox(child: Text("You must watch an ad\nin order to view the map",style: TextStyle(fontSize: 80,color: Colors.white),textAlign: TextAlign.center,)),
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
                              "Watch Ad",
                              style: TextStyle(fontSize: 80),
                            )))),
                      ),
       ],),)
        ],
      ),
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