import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coast_link/services/authentication/authentication.dart';

class FireCloudServices {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
/* Will not be using due to high reads up cost
  void getExtrovertedHobbies() async {
    List<String> extrovertedActivities = [];
    var collection = await _db.collection('extrovertedCategories');

    await collection.doc('X3Re9lhgM8JmEWtJXTMQ').get().then(
        (value) => List.from(value['extrovertedActivities']).forEach((element) {
              extrovertedActivities.add(element);
            }));
    print(extrovertedActivities);

  }
  */

  void createUserInstanceInDb(String uid, String name) 
  {
   var entity = _db.collection('users').doc(uid);
    entity.get().then((value) async {
      if(value.exists == false)
      {
        await _db.collection('users').doc(uid).set({'uid' : uid,'name' : name});
      }
    }
    );


   
  }
}
