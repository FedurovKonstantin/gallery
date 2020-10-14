import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/ui/scene/sign_in/bloc/sign_in_bloc.dart';
import 'package:gallery/app/ui/scene/sign_in/screen/sign_in.dart';
import 'package:gallery/app/ui/scene/sign_up/bloc/sign_up_bloc.dart';
import 'package:gallery/app/ui/scene/sign_up/screen/sign_up.dart';
import 'package:gallery/app/ui/scene/welcome/widget/welcome_action_button.dart';
import 'package:gallery/app/ui/scene/welcome/widget/welcome_logo.dart';
import 'package:gallery/data/utils/helpers.dart';
import 'package:gallery/repository/firebase/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/welcome_title.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WelcomeLogo(),
          WelcomeTitle('Welcome!'),
          WelcomeActionButton(
            'Create an account',
            Colors.white,
            Colors.black,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUp(),
              ),
            ),
          ),
          WelcomeActionButton(
            'I already have an account',
            Colors.black,
            Colors.white,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignIn(),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
