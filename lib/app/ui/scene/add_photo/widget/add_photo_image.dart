import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery/data/utils/helpers.dart';

class AddPhotoImage extends StatelessWidget {
  final File _image;

  const AddPhotoImage({
    File image,
  }) : _image = image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helpers.responsiveHeight(251, context),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: _image == null ? null : BoxFit.fill,
          image: _image == null
              ? AssetImage('assets/intersect.png')
              : FileImage(_image),
        ),
      ),
    );
  }
}
