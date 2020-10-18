import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/scene/profile/widget/user_photo.dart';
import 'package:gallery/app/ui/scene/settings/bloc/settings_bloc.dart';
import 'package:gallery/app/ui/scene/settings/widget/app_bar_settings.dart';
import 'package:gallery/app/ui/scene/settings/widget/email_adress_settings.dart';
import 'package:gallery/app/ui/scene/settings/widget/end_block_settings.dart';
import 'package:gallery/app/ui/scene/settings/widget/password_settings.dart';
import 'package:gallery/app/ui/scene/settings/widget/personal_data_settings.dart';
import 'package:gallery/app/ui/scene/settings/widget/user_photo_settings.dart';
import 'package:gallery/app/ui/scene/welcome/screen/welcome.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/data/utils/helpers.dart';
import 'package:gallery/repository/firebase/firebase_auth.dart';
import 'package:gallery/repository/firebase/firebase_database.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  final User user;

  Settings({this.user});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String imageUrl;

  File _image;
  ImagePicker _imagePicker = ImagePicker();

  bool localImage = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailContoller;
  TextEditingController _passwordController;
  TextEditingController _nameContoller;
  TextEditingController _birthdayController;
  TextEditingController _oldPasswordController;
  TextEditingController _confirmPasswordController;

  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();
  final focus5 = FocusNode();

  @override
  void initState() {
    imageUrl = widget.user.imageUrl;
    _emailContoller = TextEditingController(text: widget.user.email);
    _passwordController = TextEditingController();
    _oldPasswordController = TextEditingController();
    _nameContoller = TextEditingController(text: widget.user.name);
    _confirmPasswordController = TextEditingController();
    _birthdayController = TextEditingController(text: widget.user.birthday);
    super.initState();
  }

  @override
  void dispose() {
    _emailContoller.dispose();
    _passwordController.dispose();
    _nameContoller.dispose();
    _birthdayController.dispose();
    _oldPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBarSettings(
          func: () {
            if (_formKey.currentState.validate() ||
                (_oldPasswordController.text.isEmpty &&
                    _passwordController.text.isEmpty &&
                    _confirmPasswordController.text.isEmpty)) {
              if (localImage) {
                context.bloc<SettingsBloc>().add(SettingsSave(
                      name: _nameContoller.text,
                      password: _confirmPasswordController.text,
                      birthday: _birthdayController.text,
                      email: _emailContoller.text,
                      photo: _image,
                      oldEmail: widget.user.email,
                      oldPassword: widget.user.password,
                      id: widget.user.id,
                    ));
              } else {
                context.bloc<SettingsBloc>().add(SettingsSave(
                      name: _nameContoller.text,
                      password: _confirmPasswordController.text,
                      birthday: _birthdayController.text,
                      email: _emailContoller.text,
                      oldEmail: widget.user.email,
                      imageUrl: imageUrl,
                      oldPassword: widget.user.password,
                      id: widget.user.id,
                    ));
              }
            }
          },
        ),
        body: BlocConsumer<SettingsBloc, SettingsState>(
          listener: (context, state) {
            if (state is SettingsSavedSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return BlocProvider(
                      create: (context) => SettingsBloc(),
                      child: Settings(
                        user: state.user,
                      ),
                    );
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is SettingsInitial) {
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 1,
                        color: grey,
                      ),
                      SizedBox(
                        height: Helpers.responsiveHeight(21, context),
                      ),
                      localImage
                          ? UserPhotoSettings(
                              file: _image,
                            )
                          : UserPhoto(
                              imageUrl: widget.user.imageUrl,
                            ),
                      SizedBox(
                        height: Helpers.responsiveHeight(10, context),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final image = await _imagePicker.getImage(
                              source: ImageSource.gallery);
                          setState(() {
                            _image = File(image.path);
                            localImage = true;
                          });
                        },
                        child: Text(
                          'Upload photo',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: grey,
                                fontSize: Helpers.responsiveHeight(12, context),
                              ),
                        ),
                      ),
                      (state.e != null ? Text(state.e) : Container()),
                      SizedBox(
                        height: Helpers.responsiveHeight(22, context),
                      ),
                      PersonalDataSettings(
                        name: _nameContoller,
                        birthday: _birthdayController,
                        focus1: focus1,
                        focus2: focus2,
                      ),
                      SizedBox(
                        height: Helpers.responsiveHeight(39, context),
                      ),
                      EmailAdressSettings(
                        focus2: focus2,
                        focus3: focus3,
                        email: _emailContoller,
                      ),
                      SizedBox(
                        height: Helpers.responsiveHeight(39, context),
                      ),
                      PasswordSettings(
                        formKey: _formKey,
                        newPassword: _passwordController,
                        oldPassword: _oldPasswordController,
                        confirmPassword: _confirmPasswordController,
                        focus3: focus3,
                        focus4: focus4,
                        pass: widget.user.password,
                        focus5: focus5,
                        saveFucntion: () {
                          if (_formKey.currentState.validate() ||
                              (_oldPasswordController.text.isEmpty &&
                                  _passwordController.text.isEmpty &&
                                  _confirmPasswordController.text.isEmpty)) {
                            if (localImage) {
                              context.bloc<SettingsBloc>().add(SettingsSave(
                                    name: _nameContoller.text,
                                    password: _confirmPasswordController.text,
                                    birthday: _birthdayController.text,
                                    email: _emailContoller.text,
                                    oldEmail: widget.user.email,
                                    oldPassword: widget.user.password,
                                    photo: _image,
                                    id: widget.user.id,
                                  ));
                            } else {
                              context.bloc<SettingsBloc>().add(SettingsSave(
                                    name: _nameContoller.text,
                                    password: _confirmPasswordController.text,
                                    birthday: _birthdayController.text,
                                    email: _emailContoller.text,
                                    imageUrl: imageUrl,
                                    oldEmail: widget.user.email,
                                    oldPassword: widget.user.password,
                                    id: widget.user.id,
                                  ));
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: Helpers.responsiveHeight(39, context),
                      ),
                      EndBlockSettings(
                        signOut: () async {
                          await FirebaseAuth().logOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Welcome(),
                              ),
                              (route) => false);
                        },
                        delete: () async {
                          bool flag = await showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('Удаление аккаунта'),
                                  content: Text(
                                    'Вы действительно хотите удалить аккаунт?',
                                  ),
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      child: Text("Yes"),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: Text("No"),
                                    ),
                                  ],
                                );
                              });
                          if (flag == true) {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(SettingsDelete());
                            await FirebaseAuth().deleteUser(
                                widget.user.email, widget.user.password);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Welcome(),
                                ),
                                (route) => false);
                          }
                        },
                      ),
                      SizedBox(
                        height: Helpers.responsiveHeight(86, context),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is SettingsLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 1,
                      valueColor: new AlwaysStoppedAnimation<Color>(grey),
                    ),
                    SizedBox(
                      height: Helpers.responsiveHeight(10, context),
                    ),
                    Text(
                      'Loading...',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: Helpers.responsiveHeight(17, context),
                            color: grey,
                          ),
                    ),
                  ],
                ),
              );
            }
            if (state is SettingsFailure) {
              return Center(
                child: Text('Error'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
