import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:gallery/data/entity/user.dart';

import 'firebase_database.dart';

class FirebaseAuth {
  firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

  Future<User> signUp(
      {String email, String password, String name, String birthday}) async {
    try {
      firebase_auth.UserCredential result =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseDatabase(uid: result.user.uid).updateUserData(
        name,
        password,
        email,
        birthday,
      );
      return User(
        id: result.user.uid,
        email: email,
        name: name,
        birthday: birthday,
        password: password,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _auth.signOut(),
      ]);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User> logInWithEmailAndPassword(
      {String email, String password}) async {
    try {
      firebase_auth.UserCredential result =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user =
          await FirebaseDatabase(uid: result.user.uid).getUserData(email);
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
