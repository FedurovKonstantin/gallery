import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class MainAppBarTitle extends StatelessWidget {
  final TextEditingController search;

  MainAppBarTitle({
    this.search,
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
