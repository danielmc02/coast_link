import 'package:flutter_map/flutter_map.dart';
import 'package:coast_link/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../screens/home_screen/pages/connect_page.dart';
import '../screens/home_screen/pages/explore_page.dart';
import '../screens/home_screen/pages/profile_page.dart';

class HomeState extends ChangeNotifier {
  AuthServices auth = AuthServices();
  int index = 2;

  List<Widget> pages = [ConnectPage(), MapPage(), ProfilePage()];
}





