import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coast_link/services/authentication.dart';

class FireCloudServices {
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  final AuthServices _authServices = AuthServices();

  void getCategories() async {
    //var catz = await _firestoreInstance.collection("categories").doc("9vaNs3ifeI5q8gW6Yhsf").get();

  }
}
