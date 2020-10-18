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
        null,
      );
      return User(
        id: result.user.uid,
        email: email,
        name: name,
        birthday: birthday,
        password: password,
        imageUrl: null,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future updatePassword({String password}) async {
    firebase_auth.User user = _auth.currentUser;

    await user.updatePassword(password).then((_) {
      print("Succesfull changed password");
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
    });
  }

  Future updateEmail({
    String email,
  }) async {
    firebase_auth.User user = _auth.currentUser;

    await user.updateEmail(email).then((_) {
      print("Succesfull changed email");
    }).catchError((error) {
      print("Email can't be changed" + error.toString());
    });
  }

  Future deleteUser(String email, String password) async {
    try {
      firebase_auth.User user = await _auth.currentUser;
      firebase_auth.AuthCredential credentials =
          firebase_auth.EmailAuthProvider.credential(
              email: email, password: password);
      firebase_auth.UserCredential result =
          await user.reauthenticateWithCredential(credentials);
      await FirebaseDatabase(uid: result.user.uid)
          .deleteuser(); // called from database class
      await result.user.delete();
      return true;
    } catch (e) {
      print(e.toString());
      return null;
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
