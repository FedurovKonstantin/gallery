import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/scene/main/bloc/main_bloc.dart';
import 'package:gallery/data/utils/helpers.dart';

class MainAppBarTitle extends StatelessWidget {
  final TextEditingController search;
  final Function filter;
  MainAppBarTitle({
    this.search,
    this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helpers.responsiveWidth(343, context),
      height: Helpers.responsiveHeight(36, context),
      child: TextFormField(
        controller: search,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: Helpers.responsiveHeight(17, context),
              color: Colors.black,
            ),
        cursorColor: Colors.black,
        onFieldSubmitted: (value) {
          BlocProvider.of<MainBloc>(context)
              .add(MainFetchPhotos(filter: value));
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black.withOpacity(0.6),
          ),
          contentPadding: EdgeInsets.all(0),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: Helpers.responsiveHeight(17, context),
              ),
          filled: true,
          fillColor: textFieldGrey.withOpacity(0.88),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
