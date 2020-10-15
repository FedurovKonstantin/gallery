import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class AddDataTag extends StatelessWidget {
  final String _title;

  AddDataTag({
    String title,
  }) : _title = title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // child: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     Text(_title),
      //   ],
      // ),
      padding: EdgeInsets.symmetric(
        horizontal: Helpers.responsiveWidth(9, context),
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
              _title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white,
                    fontSize: Helpers.responsiveHeight(12, context),
                  ),
            ),
          ),
          SizedBox(
            width: Helpers.responsiveWidth(6, context),
          ),
          Icon(
            Icons.close,
            size: Helpers.responsiveHeight(20, context),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
