import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class DetailsDataTag extends StatelessWidget {
  final String title;

  DetailsDataTag({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Helpers.responsiveWidth(10, context),
      ),
      height: Helpers.responsiveHeight(25, context),
      decoration: BoxDecoration(
        color: purple,
        borderRadius: BorderRadius.circular(
          Helpers.responsiveHeight(16, context),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 167,
            ),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white,
                    fontSize: Helpers.responsiveHeight(12, context),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
