
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coast_link/services/authentication.dart';

class FireCloudServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final AuthServices _authServices = AuthServices();

  void getCategories() async {
    //var mapData = {'name': 'John Doe', 'occupation': 'gardener'};
    //print(mapData.toString());

await _db.collection('categories').add({"categories" : ["partying,athlete","food","painting","traveling"]}).then((value) => print(value.id));
    
      
    //item.then((value) => value.exists ? _db.collection('ax8XbnlwQNrAWL5owWf8'): print("does not exist"));
   // print()
  }
}
