import 'package:flutter/material.dart';
import 'package:gallery/data/utils/helpers.dart';

class WelcomeActionButton extends StatelessWidget {
  final String _text;
  final Color _textColor;
  final Color _backgroundColor;
  final Function _action;
  WelcomeActionButton(
    this._text,
    this._textColor,
    this._backgroundColor,
    this._action,
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _action,
      child: Container(
        margin: EdgeInsets.only(
          bottom: Helpers.responsiveHeight(10, context),
        ),
        width: Helpers.responsiveWidth(343, context),
        height: Helpers.responsiveHeight(36, context),
        decoration: BoxDecoration(
          color: _backgroundColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            _text,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: _textColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
