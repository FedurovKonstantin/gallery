import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function _func;
  ProfileAppBar({
    Function func,
  }) : _func = func;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: _func,
          child: Icon(
            Icons.settings,
            size: Helpers.responsiveHeight(22, context),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
