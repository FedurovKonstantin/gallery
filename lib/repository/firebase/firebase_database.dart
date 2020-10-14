import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallery/data/entity/photo.dart';

class FirebaseDatabase {
  final String uid;
  FirebaseDatabase({
    this.uid,
  });

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _photoCollection =
      FirebaseFirestore.instance.collection('photo');

  Future updateUserData(
      String name, String password, String email, String birthday) async {
    return await _userCollection.doc(uid).set(
      {
        'name': name,
        'passwprd': password,
        'email': email,
        'birthday': birthday,
      },
    );
  }

  Future addPhoto(Photo photo) async {
    try {
      await _photoCollection.doc(photo.imageUrl).set(photo.toJson());
    } catch (e) {
      print(e.toString());
    }
  }
}
