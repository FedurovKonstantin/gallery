import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class ProfileTitleBloc extends StatelessWidget {
  final String name;
  final String birthday;

  ProfileTitleBloc({
    this.birthday,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.black,
                fontSize: Helpers.responsiveHeight(17, context),
              ),
        ),
        SizedBox(
          height: Helpers.responsiveHeight(6, context),
        ),
        Text(
          birthday,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: grey,
                fontSize: Helpers.responsiveHeight(12, context),
              ),
        ),
      ],
    );
  }
}
