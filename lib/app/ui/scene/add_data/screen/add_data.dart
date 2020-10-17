import 'dart:io';
import 'dart:math';

import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/scene/add_data/bloc/add_data_bloc.dart';
import 'package:gallery/app/ui/scene/add_data/widget/add_data_input.dart';
import 'package:gallery/app/ui/scene/add_data/widget/add_data_tag.dart';
import 'package:gallery/app/ui/scene/add_data/widget/add_photo_data_bar.dart';
import 'package:gallery/app/ui/scene/add_photo/widget/add_photo_image.dart';
import 'package:gallery/app/ui/scene/home/screen/home.dart';
import 'package:gallery/data/entity/tag.dart';
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
  TextEditingController _tagEditingController;
  List<AddDataTag> _tags;
  final focus = FocusNode();

  @override
  void initState() {
    _nameContorller = TextEditingController();
    _descriptionContorller = TextEditingController();
    _tagEditingController = TextEditingController();
    print(widget.user.email);
    _tags = [
      AddDataTag(
          isNew: true,
          controller: _tagEditingController,
          addFunc: addTag,
          id: "New"),
    ];
    super.initState();
  }

  void addTag() {
    String title = _tagEditingController.text;
    _tags.insert(
      _tags.length - 1,
      AddDataTag(
        title: title,
        isNew: false,
        id: DateTime.now().toString(),
        removeFunc: removeTag,
      ),
    );
    _tagEditingController.clear();
    setState(() {});
  }

  void removeTag(String id) {
    var _newTags = [];
    _newTags = _tags.where((element) => element.id != id).toList();
    setState(() {
      _tags = _newTags;
    });
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AddDataAppBar(
          func: () {
            if (_formKey2.currentState.validate()) {
              context.bloc<AddDataBloc>().add(
                    AddPhoto(
                      name: _nameContorller.text,
                      description: _descriptionContorller.text,
                      email: widget.user.email,
                      photo: widget.file,
                      tags: _tags
                          .where((element) => element.id != 'New')
                          .map((e) => Tag(title: e.title))
                          .toList(),
                    ),
                  );
            }
          },
        ),
        body: BlocConsumer<AddDataBloc, AddDataState>(
          listener: (context, state) {
            if (state is AddDataSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Home(widget.user),
                ),
                (route) => false,
              );
            }
            if (state is AddDataFailure) {
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text('${state.error}'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AddDataInitial || state is AddDataFailure) {
              return SingleChildScrollView(
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
                        children: _tags,
                      ),
                    ),
                    SizedBox(
                      height: Helpers.responsiveHeight(16, context),
                    ),
                  ],
                ),
              );
            }
            if (state is AddDataLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
