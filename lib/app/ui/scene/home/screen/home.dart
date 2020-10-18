import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/scene/add_photo/screen/add_photo.dart';
import 'package:gallery/app/ui/scene/main/screen/main.dart';
import 'package:gallery/app/ui/scene/profile/bloc/profile_bloc.dart';
import 'package:gallery/app/ui/scene/profile/screen/profile.dart';
import 'package:gallery/app/ui/scene/welcome/screen/welcome.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/repository/firebase/firebase_auth.dart';

class Home extends StatefulWidget {
  User user;
  Home(this.user);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage;
  List<Widget> _pages;
  @override
  void initState() {
    _pages = [
      Main(),
      Scaffold(),
      BlocProvider(
        create: (context) =>
            ProfileBloc()..add(ProfileFetchPhotos(user: widget.user)),
        child: Profile(
          user: widget.user,
        ),
      ),
    ];
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPage,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: _currentPage,
        onTap: (index) {
          setState(
            () {
              if (index == 1) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => AddPhoto(
                      widget.user,
                    ),
                  ),
                );
              }
              if (index != 1) {
                _currentPage = index;
              }
            },
          );
        },
        showSelectedLabels: false,
        selectedItemColor: purple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_camera,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
