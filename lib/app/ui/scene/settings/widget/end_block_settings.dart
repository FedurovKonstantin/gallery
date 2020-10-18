import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class EndBlockSettings extends StatelessWidget {
  final Function signOut;
  final Function delete;

  const EndBlockSettings({
    this.signOut,
    this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Helpers.responsiveWidth(16, context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'You can ',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.black,
                      fontSize: Helpers.responsiveHeight(14, context),
                    ),
              ),
              GestureDetector(
                onTap: delete,
                child: Text(
                  'delete your account',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: purple,
                        fontSize: Helpers.responsiveHeight(14, context),
                      ),
                ),
              )
            ],
          ),
          SizedBox(
            height: Helpers.responsiveHeight(20, context),
          ),
          GestureDetector(
            onTap: signOut,
            child: Text(
              'Sign Out',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: purple,
                    fontSize: Helpers.responsiveHeight(14, context),
                  ),
            ),
          )
        ],
      ),
    );
  }
}
