import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery/data/entity/photo.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/repository/firebase/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class AddPhoto extends StatefulWidget {
  final User user;
  AddPhoto(
    this.user,
  );
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  String _imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Next',
          ),
        ),
      ),
      body: Column(
        children: [
          (_imageUrl != null)
              ? Image.network(_imageUrl)
              : Placeholder(
                  fallbackHeight: 250,
                ),
          SizedBox(
            height: 50,
          ),
          RaisedButton(
            onPressed: _uploadImage,
            color: Colors.deepPurple,
            child: Text(
              'download',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);
      var name = image.path.split('/').last;
      print(name);
      if (image != null) {
        var snapshot =
            await _storage.ref().child('images/$name').putFile(file).onComplete;

        var dowloadedUrl = await snapshot.ref.getDownloadURL();
        await FirebaseDatabase().addPhoto(
          Photo(
            creatorsEmail: widget.user.email,
            imageUrl: name,
          ),
        );
        setState(
          () {
            _imageUrl = dowloadedUrl;
            print(_imageUrl);
          },
        );
      } else {
        print('No path received');
      }
    } else {
      print('Grant permission and try again');
    }
  }
}
