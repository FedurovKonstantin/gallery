import 'dart:io';
import 'dart:math';

import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/scene/add_data/widget/add_data_input.dart';
import 'package:gallery/app/ui/scene/add_data/widget/add_data_tag.dart';
import 'package:gallery/app/ui/scene/add_data/widget/add_photo_data_bar.dart';
import 'package:gallery/app/ui/scene/add_photo/widget/add_photo_image.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/data/utils/helpers.dart';

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
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController _nameContorller;
  TextEditingController _descriptionContorller;
  TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    _nameContorller = TextEditingController();
    _descriptionContorller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AddDataAppBar(
          func: addToStorage,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: Helpers.responsiveHeight(1, context),
                color: dividerColor,
              ),
              SizedBox(
                child: Container(
                  color: Color(0xffF3F3F3),
                ),
                height: Helpers.responsiveHeight(62, context),
              ),
              AddPhotoImage(
                image: widget.file,
              ),
              SizedBox(
                child: Container(
                  color: Color(0xffF3F3F3),
                ),
                height: Helpers.responsiveHeight(63, context),
              ),
              Container(
                height: Helpers.responsiveHeight(1, context),
                color: dividerColor,
              ),
              SizedBox(
                height: Helpers.responsiveHeight(10, context),
              ),
              Form(
                key: _formKey2,
                child: AddDataInput(
                  controller: _nameContorller,
                  hint: 'Name',
                  isNecessary: true,
                  minLines: 1,
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: Helpers.responsiveHeight(10, context),
              ),
              AddDataInput(
                controller: _descriptionContorller,
                hint: 'Description',
                isNecessary: false,
                minLines: 5,
                maxLines: 5,
              ),
              SizedBox(
                height: Helpers.responsiveHeight(19, context),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Helpers.responsiveWidth(16, context),
                ),
                alignment: Alignment.centerLeft,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: Helpers.responsiveWidth(8, context),
                  runSpacing: Helpers.responsiveHeight(9, context),
                  children: [
                    AddDataTag(
                      title: 'Animals',
                    ),
                    AddDataTag(
                      title: 'Animals',
                    ),
                    AddDataTag(
                      title: 'Animals',
                    ),
                    AddDataTag(
                      title: 'AnimalsAnimalsAnimalsAnimals',
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      constraints: BoxConstraints(
                        minWidth: 44,
                        maxWidth: 500,
                      ),
                      child: IntrinsicWidth(
                        child: TextFormField(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Column getTags(List<Ta+g>) {}
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

  addToStorage() {
    if (_formKey2.currentState.validate()) {
      //good
    }
  }
}
