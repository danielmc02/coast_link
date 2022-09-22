import 'package:coast_link/services/authentication/authentication.dart';
import 'package:coast_link/services/storage/storage.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen/pages/connect_page.dart';
import '../screens/home_screen/pages/explore_page.dart';
import '../screens/home_screen/pages/profile_page.dart';

class HomeState extends ChangeNotifier {
  AuthServices auth = AuthServices();
  StorageServices store = StorageServices();
  var action = StorageServices().getData();
  int index = 1;

  List<Widget> pages = const [ConnectPage(), MapPage(), ProfilePage()];
}





