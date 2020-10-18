import 'package:flutter/material.dart';
import 'package:gallery/app/ui/scene/settings/bloc/settings_bloc.dart';
import 'package:gallery/app/ui/scene/settings/widget/old_password_input_settings.dart';
import 'package:gallery/app/ui/scene/sign_in/widget/password_text_form_field.dart';
import 'package:gallery/data/utils/helpers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordSettings extends StatelessWidget {
  final TextEditingController oldPassword;
  final TextEditingController newPassword;
  final TextEditingController confirmPassword;
  final Function saveFucntion;
  final String pass;
  final FocusNode focus3;
  final FocusNode focus4;
  final FocusNode focus5;

  final formKey;

  const PasswordSettings(
      {this.oldPassword,
      this.newPassword,
      this.confirmPassword,
      this.focus3,
      this.pass,
      this.saveFucntion,
      this.focus4,
      this.focus5,
      this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(16, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.black,
                  fontSize: Helpers.responsiveHeight(14, context),
                ),
          ),
          SizedBox(
            height: Helpers.responsiveHeight(20, context),
          ),
          OldPasswordInputSettings(
            oldPassword,
            confirmPassword,
            false,
            focus3,
            () {
              FocusScope.of(context).requestFocus(focus4);
            },
            pass,
            'Old password',
          ),
          SizedBox(
            height: Helpers.responsiveHeight(30, context),
          ),
          PasswordTextFormField(
            newPassword,
            confirmPassword,
            false,
            focus4,
            () {
              FocusScope.of(context).requestFocus(focus5);
            },
            'New password',
          ),
          SizedBox(
            height: Helpers.responsiveHeight(30, context),
          ),
          PasswordTextFormField(
            newPassword,
            confirmPassword,
            true,
            focus5,
            saveFucntion,
            'Confirm password',
          ),
        ],
      ),
    );
  }
}
