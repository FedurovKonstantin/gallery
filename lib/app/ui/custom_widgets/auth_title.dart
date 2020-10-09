import 'package:flutter/material.dart';
import 'package:gallery/data/gateway/helpers.dart';

class AuthTitle extends StatelessWidget {
  String _title;
  AuthTitle(this._title);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: Helpers.responsiveHeight(30, context),
                fontWeight: FontWeight.bold,
              ),
        ),
        Container(
          width: Helpers.responsiveHeight(105, context),
          height: Helpers.responsiveHeight(2, context),
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
