import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/scene/profile/widget/profile_title_bloc.dart';
import 'package:gallery/app/ui/scene/profile/widget/statistic_profile.dart';
import 'package:gallery/app/ui/scene/profile/widget/user_photo.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/data/utils/helpers.dart';

class UserInfoProfile extends StatelessWidget {
  final User user;
  final int views;
  final int loaded;

  UserInfoProfile({
    this.user,
    this.loaded,
    this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: grey,
          height: 1,
        ),
        SizedBox(
          height: Helpers.responsiveHeight(21, context),
        ),
        UserPhoto(
          imageUrl: user.imageUrl,
        ),
        SizedBox(
          height: Helpers.responsiveHeight(10, context),
        ),
        ProfileTitleBloc(
          birthday: user.birthday,
          name: user.name,
        ),
        SizedBox(
          height: Helpers.responsiveHeight(27, context),
        ),
        StatisticProfile(
          views: views,
          loaded: loaded,
          email: user.email,
        ),
        SizedBox(
          height: Helpers.responsiveHeight(10, context),
        ),
        Container(
          color: grey,
          height: 1,
        ),
      ],
    );
  }
}
