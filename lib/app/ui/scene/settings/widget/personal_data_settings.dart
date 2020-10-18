import 'package:flutter/material.dart';
import 'package:gallery/app/ui/scene/sign_up/widget/birthday_text_form_field.dart';
import 'package:gallery/app/ui/scene/sign_up/widget/name_text_form_field.dart';
import 'package:gallery/data/utils/helpers.dart';

class PersonalDataSettings extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController birthday;
  final FocusNode focus1;
  final FocusNode focus2;

  const PersonalDataSettings({
    this.name,
    this.birthday,
    this.focus1,
    this.focus2,
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
            'Personal data',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.black,
                  fontSize: Helpers.responsiveHeight(14, context),
                ),
          ),
          SizedBox(
            height: Helpers.responsiveHeight(20, context),
          ),
          NameTextFormField(
            name,
            (_) {
              FocusScope.of(context).requestFocus(focus1);
            },
          ),
          SizedBox(
            height: Helpers.responsiveHeight(30, context),
          ),
          BirthdayTextFormField(
            birthday,
            (_) {
              FocusScope.of(context).requestFocus(focus2);
            },
            focus1,
          ),
        ],
      ),
    );
  }
}
