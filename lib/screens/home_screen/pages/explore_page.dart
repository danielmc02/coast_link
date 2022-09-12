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
  Widget build(BuildContext context) {
    return Consumer<HomeState>(
      builder: (context, algo, child) => Stack(
        children: [
          FlutterMap(
              children: [
                TileLayer(
                  userAgentPackageName: 'com.example.coast_link',
                  urlTemplate:
                      "http://mt0.google.com/vt/lyrs=y&hl=en&x={x}&y={y}&z={z}&s=Ga",
                  //maxZoom: 40
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
              ],
              options: MapOptions(
                onTap: (tapPosition, point) => print(point),
                interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                keepAlive: true,
                maxBounds: LatLngBounds(
                  LatLng(-90, -180.0),
                  LatLng(90.0, 180.0),
                ),
                minZoom: 16,
                maxZoom: 18,
                zoom: 17,
                center: LatLng(33.67159, -117.912125994873046875),
              )), //33.66034,-117.9158099029541015625,
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
            minHeight: 60,
            panel: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                 const  Spacer(flex: 1,), 
                 CreateAGroup(),
                 CircleAvatar(
                  backgroundImage: NetworkImage(algo.auth.user.photoURL.toString()),
                  radius: 50,
                 )
                 
                ],
              ),
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          SafeArea(
            top: true,
            child: Row(mainAxisSize: MainAxisSize.max,children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(radius: 30,child: Icon(Icons.menu,size:30),backgroundColor: Color.fromARGB(127, 255, 255, 255),),
              )
            ],),
          )
        ],
      ),
    );
    //
  }
}
