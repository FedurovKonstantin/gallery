import 'package:flutter/material.dart';

class InputDefault extends StatefulWidget {
  final TextEditingController _controller;
  final String _hint;
  final bool _isNecessary;
  final String _assetsIcon;
  final double _height;
  InputDefault({
    TextEditingController controller,
    String hint,
    bool isNecessary,
    String assetsIcon,
    double height,
  })  : _controller = controller,
        _assetsIcon = assetsIcon,
        _hint = hint,
        _isNecessary = isNecessary,
        _height = height;

  @override
  _InputDefaultState createState() => _InputDefaultState();
}

class _InputDefaultState extends State<InputDefault> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(),
    );
  }
}
