import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/custom_widgets/big_button.dart';
import 'package:gallery/app/ui/scene/add_data/bloc/add_data_bloc.dart';
import 'package:gallery/app/ui/scene/add_data/screen/add_data.dart';
import 'package:gallery/app/ui/scene/add_photo/widget/add_photo_app_bar.dart';
import 'package:gallery/app/ui/scene/add_photo/widget/add_photo_image.dart';
import 'package:gallery/data/entity/photo.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/data/utils/helpers.dart';
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
  File _image;
  ImagePicker _imagePicker = ImagePicker();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffF3F3F3),
      appBar: AddPhotoAppBar(
        func: () => _goToAddData(image: _image, context: context),
      ),
      body: Column(
        children: [
          Container(
            height: Helpers.responsiveHeight(1, context),
            color: dividerColor,
          ),
          SizedBox(
            height: Helpers.responsiveHeight(62, context),
          ),
          AddPhotoImage(
            image: _image,
          ),
          SizedBox(
            height: Helpers.responsiveHeight(63, context),
          ),
          BigButton(
            title: 'Select photo',
            backgroundColor: Colors.white,
            titleColor: Colors.black,
            func: _getImage,
          ),
        ],
      ),
    );
  }

  _getImage() async {
    final image = await _imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  _goToAddData({File image, BuildContext context}) {
    if (image == null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('фото не выбрано'),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => AddDataBloc(),
              child: AddData(
                file: _image,
                user: widget.user,
              ),
            );
          },
        ),
      );
    }
  }
}
