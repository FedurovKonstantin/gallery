import 'package:flutter/material.dart';
import 'package:gallery/data/utils/helpers.dart';

class BigButton extends StatelessWidget {
  final Function _func;
  final String _title;
  final Color _backgroundColor;
  final Color _titleColor;

  BigButton({
    Function func,
    String title,
    Color backgroundColor,
    Color titleColor,
  })  : _func = func,
        _title = title,
        _backgroundColor = backgroundColor,
        _titleColor = titleColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _func,
      child: Container(
        height: Helpers.responsiveHeight(36, context),
        width: Helpers.responsiveWidth(343, context),
        decoration: BoxDecoration(
          color: _backgroundColor,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            _title,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: _titleColor,
                  fontSize: Helpers.responsiveHeight(14, context),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
