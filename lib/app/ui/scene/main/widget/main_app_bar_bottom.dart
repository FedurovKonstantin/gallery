import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class MainAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (value) {
        print(value);
      },
      indicatorPadding: EdgeInsets.symmetric(
        horizontal: Helpers.responsiveWidth(16, context),
      ),
      unselectedLabelColor: grey,
      labelColor: Colors.black,
      unselectedLabelStyle: Theme.of(context).textTheme.bodyText1.copyWith(
            fontSize: Helpers.responsiveHeight(17, context),
          ),
      labelStyle: Theme.of(context).textTheme.bodyText1.copyWith(
            fontSize: Helpers.responsiveHeight(17, context),
          ),
      tabs: [
        Tab(
          child: Text(
            'New',
          ),
        ),
        Tab(
          child: Text(
            'Popular',
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
