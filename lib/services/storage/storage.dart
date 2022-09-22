


import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageServices
{
  static final storage = FirebaseStorage.instance;

  static final storageRef = storage.ref();

  final userRef = storageRef.child('users');

  Future<String> submitPhoto(File? file, String uid)
  async {

   var url = await userRef.child(uid).putFile(file!);
   Timer(Duration(seconds: 2),(){
    print("SHOULD BE IN STORAGE");
   });
   var link = await userRef.child(uid).getDownloadURL();
    //   var links = userRef.child(uid);
    //print(links.getMetadata().then((value) => value.name));
   return link;
  }

  Future<String?> fetchProfileUrl(String uid) async
  {

 return await userRef.child(uid).getDownloadURL();
  }

Future<String> getData() {
  print('called');
  return Future.delayed(Duration(seconds: 2), () {
    print('executed');
    return "I am data";
    // throw Exception("Custom Error");
  });
}
}