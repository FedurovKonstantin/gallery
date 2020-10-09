import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  String text;
  ErrorMessage(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Theme.of(context).accentColor,
          ),
    );
  }
}
