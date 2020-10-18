import 'package:flutter/material.dart';
import 'package:gallery/app/ui/scene/sign_in/widget/email_text_form_field.dart';
import 'package:gallery/app/ui/scene/sign_up/widget/birthday_text_form_field.dart';
import 'package:gallery/app/ui/scene/sign_up/widget/name_text_form_field.dart';
import 'package:gallery/data/utils/helpers.dart';

class EmailAdressSettings extends StatelessWidget {
  final TextEditingController email;
  final FocusNode focus2;
  final FocusNode focus3;

  const EmailAdressSettings({
    this.email,
    this.focus2,
    this.focus3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(16, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'E-mail adress',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.black,
                  fontSize: Helpers.responsiveHeight(14, context),
                ),
          ),
          SizedBox(
            height: Helpers.responsiveHeight(20, context),
          ),
          EmailTextFormField(
            email,
            (_) {
              FocusScope.of(context).requestFocus(focus3);
            },
            focus2,
          ),
        ],
      ),
    );
  }
}
