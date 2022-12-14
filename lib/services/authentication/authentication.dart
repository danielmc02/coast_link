import 'dart:async';
import 'dart:io';

import 'package:coast_link/services/database/firestore_database.dart';
import 'package:coast_link/services/storage/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices
{
static final FirebaseAuth _auth = FirebaseAuth.instance;
 late User user = _auth.currentUser!;
//Stream for wrapper to observe user state
  Stream<User?> getuser() async* {
    yield* _auth.userChanges();
  }


//Sign up with email and password
  Future signUpEmailPassword(String emailAddress, String password, File? file, String name) async {
    print(emailAddress);
    try {
      debugPrint(
          "The current parameters is $emailAddress and ${password.toString()}");
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      User? user = userCredential.user;
      debugPrint(user.toString());
      debugPrint("Sucess user signed in. Welcome ${user!.uid.toString()}");
      //Create user entity
      debugPrint("Creating user entity");
      //Estamated load time for creating user
      Timer(Duration(seconds: 5), () async{
        debugPrint("Starting process");
           String link = await StorageServices().submitPhoto(file,user.uid);
           debugPrint("Just submited photo with uid");
           debugPrint("The link is $link");
     FireCloudServices().createUserInstanceInDb(user.uid,name);
     debugPrint("Just established user in DB");
     debugPrint("About to update display name");
     await user.updateDisplayName(name);
     debugPrint("Just updated name");
     debugPrint("About to update url link");
 await user.updatePhotoURL(link);
       debugPrint("Just updated photo url");

      print('end of auth');


      }
      );
     // debugPrint("User entity established");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  Future signInEmailPassword(String emailAddress, String password) async {
    print(emailAddress);
    try {
      final credential = await _auth
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      User? user = credential.user;
      //publicUser = user;
      debugPrint("Sucess user signed in. Welcome ${user!.uid.toString()}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }



Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await _auth.signInWithCredential(credential);
}



  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      //print(e.toString());
      return null;
    }
  }

}