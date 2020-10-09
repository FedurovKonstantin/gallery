import 'package:flutter/material.dart';
import 'package:gallery/data/gateway/helpers.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';

class BirthdayTextFormField extends StatefulWidget {
  TextEditingController _controller;
  Function _func;
  FocusNode _focus;
  BirthdayTextFormField(
    this._controller,
    this._func,
    this._focus,
  );
  @override
  _BirthdayTextFormFieldState createState() => _BirthdayTextFormFieldState();
}

class _BirthdayTextFormFieldState extends State<BirthdayTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      onFieldSubmitted: widget._func,
      focusNode: widget._focus,
      inputFormatters: [
        MultiMaskedTextInputFormatter(
          masks: [
            'xx.xx.xxxx',
          ],
          separator: '.',
        ),
      ],
      validator: (value) {
        if (value.length == 0) {
          return null;
        }
        if (value.length != 10 ||
            1 > int.parse(value.split('.').first) ||
            31 < int.parse(value.split('.').first) ||
            12 < int.parse(value.split('.')[1]) ||
            1 > int.parse(value.split('.')[1])) {
          return 'enter a valid data';
        }
        if (_checkBirthday(value)) {
          return null;
        }
        return 'age >=18 or nothing';
      },
      //textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.calendar_today_outlined,
          size: Helpers.responsiveHeight(22, context),
          color: Color(0xffC4C4C4),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(10, context),
          vertical: Helpers.responsiveHeight(8, context),
        ),
        hintText: 'Bithday',
        hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: Helpers.responsiveHeight(17, context),
              color: Color(0xffC4C4C4),
            ),
        filled: true,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
            width: 1,
          ),
        ),
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffC4C4C4),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffC4C4C4),
            width: 1,
          ),
        ),
      ),
    );
  }

  bool _checkBirthday(String value) {
    // Current time - at this moment
    DateTime today = DateTime.now();

    // Parsed date to check
    DateTime birthDate = DateTime(
      int.parse(value.split('.').last),
      int.parse(value.split('.')[1]),
      int.parse(
        value.split('.').first,
      ),
    );

    // Date to check but moved 18 years ahead
    DateTime adultDate = DateTime(
      birthDate.year + 18,
      birthDate.month,
      birthDate.day,
    );

    return adultDate.isBefore(today);
  }
}
