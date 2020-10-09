import 'package:flutter/material.dart';
import 'package:gallery/data/gateway/helpers.dart';

class EmailTextFormField extends StatefulWidget {
  TextEditingController _controller;
  Function _func;
  FocusNode _focus;
  EmailTextFormField(this._controller, this._func, this._focus);
  @override
  _EmailTextFormFieldState createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      onFieldSubmitted: widget._func,
      focusNode: widget._focus,
      //textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.email_outlined,
          size: Helpers.responsiveHeight(22, context),
          color: Color(0xffC4C4C4),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(10, context),
          vertical: Helpers.responsiveHeight(8, context),
        ),
        hintText: 'Email',
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
        if (value.contains('@')) {
          return null;
        }
        return 'Email should contain @';
      },
    );
  }
}
