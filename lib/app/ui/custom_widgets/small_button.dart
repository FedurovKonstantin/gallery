import 'package:flutter/material.dart';
import 'package:gallery/data/gateway/helpers.dart';

class SmallButton extends StatelessWidget {
  String _text;
  Color _textColor;
  Color _backgroundColor;
  Function _func;
  SmallButton(
    this._text,
    this._textColor,
    this._backgroundColor,
    this._func,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _func,
      child: Container(
        width: Helpers.responsiveWidth(120, context),
        height: Helpers.responsiveHeight(36, context),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            _text,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: Helpers.responsiveHeight(17, context),
                  fontWeight: FontWeight.bold,
                  color: _textColor,
                ),
          ),
        ),
      ),
    );
  }
}
