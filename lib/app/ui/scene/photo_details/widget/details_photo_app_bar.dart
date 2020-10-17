import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class DetailsPhotoAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.keyboard_arrow_left,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
