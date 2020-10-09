import 'package:flutter/material.dart';
import 'package:gallery/data/gateway/helpers.dart';

class WelcomeTitle extends StatelessWidget {
  String _title;
  WelcomeTitle(this._title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Helpers.responsiveHeight(40, context),
      ),
      child: Text(
        _title,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.black,
              fontSize: Helpers.responsiveHeight(25, context),
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
