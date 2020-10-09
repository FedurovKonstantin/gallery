import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabase {
  final String uid;
  FirebaseDatabase({
    this.uid,
  });
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  Future updateUserData(
      String name, String password, String email, String birthday) async {
    return await userCollection.doc(uid).set(
      {
        'name': name,
        'passwprd': password,
        'email': email,
        'birthday': birthday,
      },
    );
  }
}
