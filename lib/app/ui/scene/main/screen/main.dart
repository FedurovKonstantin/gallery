import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/scene/main/bloc/main_bloc.dart';
import 'package:gallery/app/ui/scene/main/widget/main_app_bar_bottom.dart';
import 'package:gallery/app/ui/scene/main/widget/main_app_bar_title.dart';
import 'package:gallery/app/ui/scene/main/widget/main_body_tab.dart';
import 'package:gallery/data/entity/category.dart';
import 'package:gallery/data/utils/helpers.dart';
import 'dart:async';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  TextEditingController _search;

  @override
  void initState() {
    _search = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: MainAppBarTitle(
              search: _search,
            ),
            bottom: MainAppBarBottom(),
          ),
          body: Container(
            padding: EdgeInsets.only(
              top: Helpers.responsiveHeight(20, context),
              left: Helpers.responsiveWidth(16, context),
              right: Helpers.responsiveWidth(16, context),
            ),
            child: BlocProvider(
              create: (context) => MainBloc()..add(MainFetchPhotos()),
              child: TabBarView(
                children: [
                  MainBodyTab(
                    category: Category(title: "New"),
                  ),
                  MainBodyTab(
                    category: Category(title: "Popular"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
