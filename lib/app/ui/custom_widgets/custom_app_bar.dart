import 'package:flutter/material.dart';
import 'package:gallery/data/gateway/helpers.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Helpers.responsiveHeight(14, context),
                horizontal: Helpers.responsiveWidth(16, context),
              ),
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: Helpers.responsiveHeight(15, context),
                      color: Color(0xff5F5F5F),
                    ),
              ),
            ),
          ),
          Container(
            height: Helpers.responsiveHeight(1, context),
            color: Color(0xffC4C4C4),
          ),
        ],
      ),
    );
  }
}
