import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery/data/entity/user.dart';

class AddData extends StatefulWidget {
  File file;
  User user;
  AddData({
    this.file,
    this.user,
  });
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.user.id),
      ),
    );
  }
  //   _uploadImage() async {
  //   final _storage = FirebaseStorage.instance;
  //   final _picker = ImagePicker();
  //   PickedFile image;
  //   await Permission.photos.request();
  //   var permissionStatus = await Permission.photos.status;

  //   if (permissionStatus.isGranted) {
  //     image = await _picker.getImage(source: ImageSource.gallery);
  //     var file = File(image.path);
  //     var name = image.path.split('/').last;
  //     print(name);
  //     if (image != null) {
  //       var snapshot =
  //           await _storage.ref().child('images/$name').putFile(file).onComplete;

  //       var dowloadedUrl = await snapshot.ref.getDownloadURL();
  //       await FirebaseDatabase().addPhoto(
  //         Photo(
  //           creatorsEmail: widget.user.email,
  //           imageUrl: name,
  //         ),
  //       );
  //       setState(
  //         () {
  //           _imageUrl = dowloadedUrl;
  //           print(_imageUrl);
  //         },
  //       );
  //     } else {
  //       print('No path received');
  //     }
  //   } else {
  //     print('Grant permission and try again');
  //   }
  // }
}
