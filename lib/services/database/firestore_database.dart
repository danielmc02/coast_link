import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coast_link/services/authentication.dart';

class FireCloudServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final AuthServices _authServices = AuthServices();

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
}
