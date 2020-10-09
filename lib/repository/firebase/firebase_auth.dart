import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:gallery/data/entity/user.dart';

import 'firebase_database.dart';

class FirebaseAuth {
  firebase_auth.FirebaseAuth _auth;
  FirebaseAuth({
    firebase_auth.FirebaseAuth firebaseAuth,
  }) : _auth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? null : User(id: firebaseUser.uid);
    });
  }

  Future<void> signUp({
    String email,
    String password,
    String name,
    String birthday,
  }) async {
    try {
      firebase_auth.UserCredential result =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = User(id: result.user.uid);
      await FirebaseDatabase(uid: user.id).updateUserData(
        name,
        password,
        email,
        birthday,
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

  Future<void> logInWithEmailAndPassword({
    String email,
    String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
// User _userFromFirebaseuser(firebase_auth.FirebaseUser user) {
//   return user != null ? User(id: user.uid) : null;
// }
