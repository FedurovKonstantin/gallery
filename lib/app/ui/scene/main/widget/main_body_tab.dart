import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/scene/main/bloc/main_bloc.dart';
import 'package:gallery/app/ui/scene/main/widget/grid_item.dart';
import 'package:gallery/data/entity/category.dart';
import 'package:gallery/data/entity/photo.dart';
import 'package:gallery/data/utils/helpers.dart';
import 'dart:async';

class MainBodyTab extends StatefulWidget {
  final Category category;

  MainBodyTab({this.category});

  @override
  _MainBodyTabState createState() => _MainBodyTabState();
}

class _MainBodyTabState extends State<MainBodyTab>
    with AutomaticKeepAliveClientMixin {
  Completer<void> _refreshCompleter;

  List<Photo> getPhotos(MainSuccess state) {
    if (widget.category.title == "New") {
      return state.newPhotos;
    } else {
      return state.popularPhotos;
    }
  }

  @override
  void initState() {
    _refreshCompleter = Completer<void>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        context.bloc<MainBloc>().add(MainFetchPhotos());
        return _refreshCompleter.future;
      },
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          if (state != MainInitial()) {
            _refreshCompleter?.complete();
            _refreshCompleter = Completer();
          }
        },
        builder: (context, state) {
          if (state is MainFailure) {
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
          if (state is MainSuccess) {
            if (getPhotos(state).length == 0) {
              return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: Helpers.responsiveHeight(600, context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: grey,
                              fontSize: Helpers.responsiveHeight(17, context),
                            ),
                      ),
                      SizedBox(
                        height: Helpers.responsiveHeight(8, context),
                      ),
                      Text(
                        'There is no pictures.\n Pleace come back later.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: grey,
                              fontSize: Helpers.responsiveHeight(12, context),
                            ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: Helpers.responsiveWidth(9, context),
              mainAxisSpacing: Helpers.responsiveWidth(9, context),
              children: getPhotos(state)
                  .map((e) => GridItem(
                        photo: e,
                      ))
                  .toList(),
            );
          }
          if (state is MainInitial) {
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
