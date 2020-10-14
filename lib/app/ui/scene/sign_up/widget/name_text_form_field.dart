import 'package:flutter/material.dart';
import 'package:gallery/data/utils/helpers.dart';

class NameTextFormField extends StatefulWidget {
  TextEditingController _controller;
  Function _func;
  NameTextFormField(
    this._controller,
    this._func,
  );
  @override
  _NameTextFormFieldState createState() => _NameTextFormFieldState();
}

class _NameTextFormFieldState extends State<NameTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      onFieldSubmitted: widget._func,
      //textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.person_outline,
          size: Helpers.responsiveHeight(22, context),
          color: Color(0xffC4C4C4),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(10, context),
          vertical: Helpers.responsiveHeight(8, context),
        ),
        hintText: 'User Name',
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
      validator: (value) {
        if (value.contains(new RegExp(r'[a-z]'))) {
          return null;
        }
        return 'Enter you name';
      },
    );
  }
}
