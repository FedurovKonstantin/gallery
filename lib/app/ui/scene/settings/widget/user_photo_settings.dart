import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';

class UserPhotoSettings extends StatelessWidget {
  final File file;

  UserPhotoSettings({this.file});

  @override
  Widget build(BuildContext context) {
    return file == null
        ? Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: grey),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                'assets/profile_back.png',
                color: iconGrey,
              ),
            ))
        : Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(file),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          );
  }
}
