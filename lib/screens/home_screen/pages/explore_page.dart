import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
              layers: [
                TileLayerOptions(
                  userAgentPackageName: 'com.example.coast_link',
                  urlTemplate:
                      "http://mt0.google.com/vt/lyrs=y&hl=en&x={x}&y={y}&z={z}&s=Ga",
                  //maxZoom: 40
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(point: LatLng(33.670987,-117.912459), builder: (context) => GestureDetector(onTap: () => print("CLICKED"),child: Column(
                      children: [
                        CircleAvatar(child: Icon(Icons.person),),
                        Text("EVENT",style: TextStyle(fontSize: 50),)
                      ],
                    )),width: 70,height: 70)
                  ]
                )
              ],
              options: MapOptions(
                onTap: (tapPosition, point) => print(point),
                interactiveFlags:InteractiveFlag.all & ~InteractiveFlag.rotate,
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
        ],
      ),
    ); //
  }
}