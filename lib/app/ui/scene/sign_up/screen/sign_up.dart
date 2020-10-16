import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/ui/custom_widgets/auth_title.dart';
import 'package:gallery/app/ui/custom_widgets/custom_app_bar.dart';
import 'package:gallery/app/ui/custom_widgets/error_message.dart';
import 'package:gallery/app/ui/custom_widgets/small_button.dart';
import 'package:gallery/app/ui/scene/home/screen/home.dart';
import 'package:gallery/app/ui/scene/sign_in/screen/sign_in.dart';
import 'package:gallery/app/ui/scene/sign_in/widget/email_text_form_field.dart';
import 'package:gallery/app/ui/scene/sign_in/widget/password_text_form_field.dart';
import 'package:gallery/app/ui/scene/sign_up/bloc/sign_up_bloc.dart';
import 'package:gallery/app/ui/scene/sign_up/widget/birthday_text_form_field.dart';
import 'package:gallery/app/ui/scene/sign_up/widget/name_text_form_field.dart';
import 'package:gallery/data/utils/helpers.dart';
import 'package:gallery/repository/firebase/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailContoller;
  TextEditingController _passwordController;
  TextEditingController _nameContoller;
  TextEditingController _birthdayController;
  TextEditingController _confirmPasswordController;
  @override
  void initState() {
    _emailContoller = TextEditingController();
    _passwordController = TextEditingController();
    _nameContoller = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _birthdayController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailContoller.dispose();
    _passwordController.dispose();
    _nameContoller.dispose();
    _birthdayController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: BlocProvider(
            create: (context) => SignUpBloc(),
            child: BlocConsumer<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccessfully) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => Home(state.user),
                      ),
                      (route) => false);
                }
              },
              builder: (context, state) {
                if (state is SignUpLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SignUpInitial || state is SignUpFailed) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomAppBar(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Helpers.responsiveWidth(16, context),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: Helpers.responsiveHeight(100, context),
                                  bottom: Helpers.responsiveHeight(50, context),
                                ),
                                child: AuthTitle('Sign Up'),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    NameTextFormField(
                                      _nameContoller,
                                      (_) {
                                        FocusScope.of(context)
                                            .requestFocus(focus1);
                                      },
                                    ),
                                    SizedBox(
                                      height:
                                          Helpers.responsiveHeight(30, context),
                                    ),
                                    BirthdayTextFormField(
                                      _birthdayController,
                                      (_) {
                                        FocusScope.of(context)
                                            .requestFocus(focus2);
                                      },
                                      focus1,
                                    ),
                                    SizedBox(
                                      height:
                                          Helpers.responsiveHeight(30, context),
                                    ),
                                    EmailTextFormField(
                                      _emailContoller,
                                      (_) {
                                        FocusScope.of(context)
                                            .requestFocus(focus3);
                                      },
                                      focus2,
                                    ),
                                    SizedBox(
                                      height:
                                          Helpers.responsiveHeight(30, context),
                                    ),
                                    PasswordTextFormField(
                                      _passwordController,
                                      _confirmPasswordController,
                                      false,
                                      focus3,
                                      () {
                                        FocusScope.of(context)
                                            .requestFocus(focus4);
                                      },
                                      'Old Password',
                                    ),
                                    SizedBox(
                                      height:
                                          Helpers.responsiveHeight(30, context),
                                    ),
                                    PasswordTextFormField(
                                      _passwordController,
                                      _confirmPasswordController,
                                      true,
                                      focus4,
                                      () {
                                        if (_formKey.currentState.validate() &&
                                            _passwordController.text ==
                                                _confirmPasswordController
                                                    .text) {
                                          context.bloc<SignUpBloc>().add(
                                                SignUpCheckCredentials(
                                                  email: _emailContoller.text,
                                                  password:
                                                      _passwordController.text,
                                                  birthday:
                                                      _birthdayController.text,
                                                  name: _nameContoller.text,
                                                ),
                                              );
                                        }
                                      },
                                      'Confirm Password',
                                    ),
                                    SizedBox(
                                      height:
                                          Helpers.responsiveHeight(20, context),
                                    ),
                                    (state is SignUpFailed)
                                        ? ErrorMessage(state.e)
                                        : Container(),
                                    SizedBox(
                                      height:
                                          Helpers.responsiveHeight(40, context),
                                    ),
                                    SmallButton(
                                      'Sign Up',
                                      Colors.white,
                                      Colors.black,
                                      () async {
                                        if (_formKey.currentState.validate() &&
                                            _passwordController.text ==
                                                _confirmPasswordController
                                                    .text) {
                                          context.bloc<SignUpBloc>().add(
                                                SignUpCheckCredentials(
                                                  email: _emailContoller.text,
                                                  password:
                                                      _passwordController.text,
                                                  birthday:
                                                      _birthdayController.text,
                                                  name: _nameContoller.text,
                                                ),
                                              );
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height:
                                          Helpers.responsiveHeight(10, context),
                                    ),
                                    SmallButton(
                                      'Sign In',
                                      Colors.black,
                                      Colors.white,
                                      () {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => SignIn(),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: Helpers.responsiveHeight(
                                          100, context),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
