import 'package:flutter/material.dart';
import 'package:gallery/data/gateway/helpers.dart';

class PasswordTextFormField extends StatefulWidget {
  TextEditingController _controller;
  TextEditingController _confirmController;
  bool _confirm;
  FocusNode _focusNode;
  Function _func;
  String _hintText;
  PasswordTextFormField(
    this._controller,
    this._confirmController,
    this._confirm,
    this._focusNode,
    this._func,
    this._hintText,
  );
  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
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
          if (value.length < 8 || !value.contains(new RegExp(r'[A-Z]'))) {
            return ' password length >= 8 and containes at least 1 uppercase letter';
          }
          if (widget._confirmController?.text != widget._controller?.text &&
              widget._confirmController != null) {
            return "пароли не совпадают";
          }
          return null;
        },
      ),
    );
  }
}
