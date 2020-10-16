import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/ui/custom_widgets/auth_title.dart';
import 'package:gallery/app/ui/custom_widgets/custom_app_bar.dart';
import 'package:gallery/app/ui/custom_widgets/error_message.dart';
import 'package:gallery/app/ui/custom_widgets/small_button.dart';
import 'package:gallery/app/ui/scene/home/screen/home.dart';
import 'package:gallery/app/ui/scene/sign_in/bloc/sign_in_bloc.dart';
import 'package:gallery/app/ui/scene/sign_in/widget/email_text_form_field.dart';
import 'package:gallery/app/ui/scene/sign_in/widget/password_text_form_field.dart';
import 'package:gallery/app/ui/scene/sign_in/widget/sub_title_sign_in.dart';
import 'package:gallery/app/ui/scene/sign_up/screen/sign_up.dart';
import 'package:gallery/data/utils/helpers.dart';
import 'package:gallery/repository/firebase/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailContoller;
  TextEditingController _passwordController;
  @override
  void initState() {
    _emailContoller = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailContoller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: BlocProvider(
            create: (context) => SignInBloc(),
            child: BlocConsumer<SignInBloc, SignInState>(
              listener: (context, state) {
                if (state is SignInSuccessfully) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home(state.user)),
                      (route) => false);
                }
              },
              builder: (context, state) {
                if (state is SignInLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SignInInitial || state is SignInFailed) {
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
                                child: AuthTitle('Sign In'),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    EmailTextFormField(_emailContoller, (_) {
                                      FocusScope.of(context)
                                          .requestFocus(focus);
                                    }, null),
                                    SizedBox(
                                      height:
                                          Helpers.responsiveHeight(30, context),
                                    ),
                                    PasswordTextFormField(
                                      _passwordController,
                                      null,
                                      false,
                                      focus,
                                      () {
                                        if (_formKey.currentState.validate()) {
                                          context.bloc<SignInBloc>().add(
                                                SignInCheckCredentials(
                                                  email: _emailContoller.text,
                                                  password:
                                                      _passwordController.text,
                                                ),
                                              );
                                        }
                                      },
                                      null,
                                    ),
                                    SizedBox(
                                      height:
                                          Helpers.responsiveHeight(10, context),
                                    ),
                                    SubTitleSignIn(),
                                    SizedBox(
                                      height:
                                          Helpers.responsiveHeight(20, context),
                                    ),
                                    (state is SignInFailed)
                                        ? ErrorMessage(state.e)
                                        : Container(),
                                    SizedBox(
                                      height:
                                          Helpers.responsiveHeight(50, context),
                                    ),
                                    SmallButton(
                                      'Sign In',
                                      Colors.white,
                                      Colors.black,
                                      () {
                                        if (_formKey.currentState.validate()) {
                                          context.bloc<SignInBloc>().add(
                                                SignInCheckCredentials(
                                                  email: _emailContoller.text,
                                                  password:
                                                      _passwordController.text,
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
                                      'Sign Up',
                                      Colors.black,
                                      Colors.white,
                                      () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SignUp(),
                                          ),
                                        );
                                      },
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
