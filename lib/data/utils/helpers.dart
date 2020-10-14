import 'package:flutter/material.dart';

class Helpers {
  static double responsiveHeight(double size, BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return height * (size / 812);
  }

  static double responsiveWidth(double size, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width * (size / 375);
  }
}
