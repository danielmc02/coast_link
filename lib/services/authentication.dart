import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthServices
{

final FirebaseAuth _auth = FirebaseAuth.instance;
late User _user = _auth.currentUser!;

//Stream for wrapper to observe user state
  Stream<User?> getuser() async* {
    yield* _auth.userChanges();
  }


//Sign up with email and password
  Future signUpEmailPassword(String emailAddress, String password) async {
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