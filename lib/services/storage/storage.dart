


import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageServices
{
  static final storage = FirebaseStorage.instance;

  static final storageRef = storage.ref();

  final userRef = storageRef.child('users');

  Future<String> submitPhoto(File? file, String uid)
  async {

   var url =userRef..child(uid).putFile(file!);
   var link = await userRef.child(uid).getDownloadURL();
   print(link);
   return link;
  }


}