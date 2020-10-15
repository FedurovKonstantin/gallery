import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class AddDataAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function _func;

  AddDataAppBar({
    Function func,
  }) : _func = func;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Icon(
          Icons.keyboard_arrow_left,
          //size: Helpers.responsiveHeight(15, context),
          color: Colors.black,
        ),
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: _func,
          child: Text(
            'Add ',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: purple,
                  fontWeight: FontWeight.w700,
                  fontSize: Helpers.responsiveHeight(15, context),
                ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
