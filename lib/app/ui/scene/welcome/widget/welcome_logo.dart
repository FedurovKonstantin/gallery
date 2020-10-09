import 'package:flutter/material.dart';
import 'package:gallery/data/gateway/helpers.dart';

class WelcomeLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/intersect.png',
      height: Helpers.responsiveHeight(139, context),
      width: Helpers.responsiveWidth(136, context),
    );
  }
}
