import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class AppBarSettings extends StatelessWidget implements PreferredSizeWidget {
  final Function _func;
  AppBarSettings({
    Function func,
  }) : _func = func;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
      leading: Container(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: darkGrey,
                  fontSize: Helpers.responsiveHeight(15, context),
                ),
          ),
        ),
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: _func,
          child: Text(
            'Save',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: purple,
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
