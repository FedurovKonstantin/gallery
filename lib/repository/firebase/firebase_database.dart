import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallery/data/entity/category.dart';
import 'package:gallery/data/entity/photo.dart';
import 'package:gallery/data/entity/user.dart';

class FirebaseDatabase {
  final String uid;
  FirebaseDatabase({
    this.uid,
  });

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _photoCollection =
      FirebaseFirestore.instance.collection('photos');

  Future updateUserData(
    String name,
    String password,
    String email,
    String birthday,
  ) async {
    return await _userCollection.doc(uid).set(
      {
        "id": uid,
        'name': name,
        'password': password,
        'email': email,
        'birthday': birthday,
      },
    );
  }

  Future<User> getUserData(
    String email,
  ) async {
    try {
      var result = await _userCollection.get();
      User user;
      result.docs.forEach((e) {
        print(e.data());
        if (e.data()["email"] == email) {
          user = User.fromJson(json: e.data());
        }
      });
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future addPhoto(Photo photo) async {
    try {
      await _photoCollection.doc(photo.id).set(photo.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  // Future updatePhoto(Photo photo) async {
  //   try {
  //     await _photoCollection.doc(photo.id).set(photo.toJson());
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<List<Photo>> getPhotos({
    Category category,
  }) async {
    try {
      var result = await _photoCollection
          .where("category", arrayContains: category.title)
          .get();
      List<Photo> _photos = [];
      result.docs.forEach((e) {
        _photos.add(
          Photo.fromJson(e.data()),
        );
      });
      return _photos;
    } catch (e) {
      throw Exception(e);
    }
  }
}
