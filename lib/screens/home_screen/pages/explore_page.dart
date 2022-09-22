import 'dart:math';

import 'package:coast_link/components/map_choices_cards.dart';
import 'package:coast_link/components/sliding_sheet.dart';
import 'package:coast_link/screens/forms/create_a_group.dart';
import 'package:coast_link/state_providers/home_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  void initState() {
    //if user
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeState>(
      builder: (context, algo, child) => Stack(
        children: [
          FlutterMap(
              options: MapOptions(
                onTap: (tapPosition, point) => print(point),
                interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                keepAlive: true,
                maxBounds: LatLngBounds(
                  LatLng(-90, -180.0),
                  LatLng(90.0, 180.0),
                ),
                minZoom: 14,
                maxZoom: 18,
                zoom: 14,//17,
                center: LatLng(33.67159, -117.912125994873046875),
              ),
              children: [
                TileLayer(
                  userAgentPackageName: 'com.example.coast_link',
                  urlTemplate:
                      "http://mt0.google.com/vt/lyrs=y&hl=en&x={x}&y={y}&z={z}&s=Ga",
                  //maxZoom: 40
                ),
                Container(
                  color: Color.fromARGB(135, 255, 242, 241),
                ),
                MarkerLayer(markers: [
                  Marker(
                      point: LatLng(33.670987, -117.912459),
                      builder: (context) => GestureDetector(
                          onTap: () => print("CLICKED"),
                          child: Column(
                            children: [
                              const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              //Text("EVENT",style: TextStyle(fontSize: 50),)
                            ],
                          )),
                      width: 70,
                      height: 70)
                ])
              ]), //33.66034,-117.9158099029541015625,
          /*Container(
              color: Color.fromARGB(79, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FittedBox(
                      child: Text(
                    "You must watch an ad\nin order to view the map",
                    style: TextStyle(fontSize: 80, color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
                  CreateAdWidget(),
                ],
              ),
            )*/
          SlidingUpPanel(
            minHeight: 200, //60
            panel: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: FractionallySizedBox(
                        widthFactor: .5,
                        child: Container(
                          height: 5,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(height:20,),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(algo.auth.user.photoURL!),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                          child: FittedBox(
                              child: Text(
                        algo.auth.user.displayName.toString(),
                        style: Theme.of(context).textTheme.headline3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )))
                    ],
                  ),
                  SizedBox(height: 50,),
                  Container(
                    height: 200,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        CreateAGroup(),
                        CreateAGroup(),
                        CreateAGroup(),
                                          TextButton(
                      onPressed: () {
                        print(algo.auth.user);
                      },
                      child: Text('safsd'))
                      ],
                    ),
                  ),


                ],
              ),
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          SafeArea(
            top: true,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(127, 255, 255, 255),
                    child: Icon(Icons.menu, size: 30),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    //
  }
}
