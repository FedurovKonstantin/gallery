import 'package:flutter/material.dart';
import 'package:gallery/data/utils/helpers.dart';

class OldPasswordInputSettings extends StatefulWidget {
  TextEditingController _controller;
  TextEditingController _confirmController;
  bool _confirm;
  FocusNode _focusNode;
  Function _func;
  String _hintText;
  String oldPassword;
  OldPasswordInputSettings(
    this._controller,
    this._confirmController,
    this._confirm,
    this._focusNode,
    this._func,
    this.oldPassword,
    this._hintText,
  );
  @override
  _OldPasswordInputSettingsState createState() =>
      _OldPasswordInputSettingsState();
}

class _OldPasswordInputSettingsState extends State<OldPasswordInputSettings> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: Helpers.responsiveHeight(36, context),
      child: TextFormField(
        controller:
            widget._confirm ? widget._confirmController : widget._controller,
        obscureText: _obscure,
        onFieldSubmitted: (_) {
          widget._func();
        },
        focusNode: widget._focusNode,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
            child: Icon(
              Icons.visibility_outlined,
              size: Helpers.responsiveHeight(22, context),
              color: Color(0xffC4C4C4),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: Helpers.responsiveWidth(10, context),
            vertical: Helpers.responsiveHeight(8, context),
          ),
          hintText: widget._hintText ?? 'Password',
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
          if (value != widget.oldPassword) {
            return 'старый пароль не совпадает с настоящим';
          }
          return null;
        },
      ),
    );
  }
}
