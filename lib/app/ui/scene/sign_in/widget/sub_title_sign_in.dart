import 'package:flutter/material.dart';
import 'package:gallery/data/gateway/helpers.dart';

class SubTitleSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(
        'Forgot login or password?',
        style: TextStyle(
          color: Color(0xffC4C4C4),
          fontSize: Helpers.responsiveHeight(13, context),
        ),
      ),
    );
  }
}
