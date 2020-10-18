import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/scene/main/widget/grid_item.dart';
import 'package:gallery/app/ui/scene/profile/bloc/profile_bloc.dart';
import 'package:gallery/app/ui/scene/profile/widget/profile_app_bar.dart';
import 'package:gallery/app/ui/scene/profile/widget/user_info_profile.dart';
import 'package:gallery/app/ui/scene/settings/bloc/settings_bloc.dart';
import 'package:gallery/app/ui/scene/settings/screen/settings.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/data/utils/helpers.dart';

class Profile extends StatefulWidget {
  final User user;

  Profile({this.user});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Completer<void> _refreshCompleter;
  User user;
  @override
  void initState() {
    _refreshCompleter = Completer<void>();
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeScreen = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        ProfileAppBar().preferredSize.height * 2;
    return Scaffold(
      appBar: ProfileAppBar(
        func: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (BuildContext context) => SettingsBloc(),
              child: Settings(
                user: user,
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          context
              .bloc<ProfileBloc>()
              .add(ProfileFetchPhotos(user: widget.user));
          return _refreshCompleter.future;
        },
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileSuccess) {
              setState(() {
                user = state.user;
              });
            }
            if (state != ProfileInitial()) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
            }
          },
          builder: (context, state) {
            if (state is ProfileSuccess) {
              if (state.photos.length == 0) {
                return SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Container(
                    height: sizeScreen,
                    child: Column(
                      children: [
                        UserInfoProfile(
                          user: state.user,
                          loaded: state.loaded,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/intersect_grey.png',
                                  height: Helpers.responsiveHeight(78, context),
                                  width: Helpers.responsiveWidth(74, context),
                                ),
                                SizedBox(
                                  height: Helpers.responsiveHeight(8, context),
                                ),
                                Text(
                                  'Sorry!',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        color: grey,
                                        fontSize: Helpers.responsiveHeight(
                                            17, context),
                                      ),
                                ),
                                SizedBox(
                                  height: Helpers.responsiveHeight(8, context),
                                ),
                                Text(
                                  'There is no pictures.\n Pleace come back later.',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        color: grey,
                                        fontSize: Helpers.responsiveHeight(
                                            12, context),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Column(
                children: [
                  UserInfoProfile(
                    user: state.user,
                    loaded: state.loaded,
                  ),
                  SizedBox(
                    height: Helpers.responsiveHeight(20, context),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Helpers.responsiveWidth(16, context)),
                      child: GridView.count(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        crossAxisSpacing: Helpers.responsiveWidth(9, context),
                        mainAxisSpacing: Helpers.responsiveWidth(9, context),
                        children: state.photos
                            .map((e) => GridItem(photo: e))
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Helpers.responsiveHeight(16, context),
                  ),
                ],
              );
            }
            if (state is ProfileFailure) {
              return Center(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Container(
                    height: Helpers.responsiveHeight(600, context),
                    child: Center(
                      child: Text(
                        "Error ${state.e}",
                      ),
                    ),
                  ),
                ),
              );
            }
            if (state is ProfileInitial) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 1,
                      valueColor: new AlwaysStoppedAnimation<Color>(grey),
                    ),
                    SizedBox(
                      height: Helpers.responsiveHeight(10, context),
                    ),
                    Text(
                      'Loading...',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: Helpers.responsiveHeight(17, context),
                            color: grey,
                          ),
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
