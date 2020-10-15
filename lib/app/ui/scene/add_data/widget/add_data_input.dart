import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery/data/utils/helpers.dart';

class AddDataInput extends StatelessWidget {
  final TextEditingController _controller;
  final bool _isNecessary;
  final String _hint;
  final double _height;
  final int _minLines;
  final int _maxLines;
  AddDataInput({
    TextEditingController controller,
    bool isNecessary,
    String hint,
    double height,
    int minLines,
    int maxLines,
  })  : _height = height,
        _hint = hint,
        _maxLines = maxLines,
        _minLines = minLines,
        _controller = controller,
        _isNecessary = isNecessary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helpers.responsiveWidth(343, context),
      //height: _height,
      child: TextFormField(
        controller: _controller,
        minLines: _minLines,
        maxLines: _maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: Helpers.responsiveWidth(10, context),
            vertical: Helpers.responsiveHeight(8, context),
          ),
          hintText: _hint,
          hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: Helpers.responsiveHeight(17, context),
                color: Color(0xffC4C4C4),
              ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffC4C4C4),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffC4C4C4),
            ),
          ),
        ),
        validator: (value) {
          if (_isNecessary && value.trim().length == 0) {
            return 'please enter a name';
          }
          return null;
        },
      ),
    );
  }
}
