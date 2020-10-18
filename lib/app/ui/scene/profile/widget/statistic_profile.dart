import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';
import 'package:gallery/repository/firebase/firebase_database.dart';

class StatisticProfile extends StatelessWidget {
  final int views;
  final int loaded;
  final String email;

  StatisticProfile({
    this.loaded,
    this.views,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Helpers.responsiveWidth(16, context),
      ),
      child: Row(
        children: [
          Container(
            width: Helpers.responsiveWidth(66, context),
            child: Row(
              children: [
                Text(
                  'Views: ',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black,
                        fontSize: Helpers.responsiveHeight(12, context),
                      ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseDatabase().getViews(email: email),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    int views = 0;
                    snapshot?.data?.docs?.forEach((e) {
                      views += e.data()["viewCounter"] as int;
                    });
                    return Text(
                      views > 999 ? '999+' : views.toString(),
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: grey,
                            fontSize: Helpers.responsiveHeight(12, context),
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: Helpers.responsiveWidth(20, context),
          ),
          Container(
            width: Helpers.responsiveWidth(74, context),
            child: Row(
              children: [
                Text(
                  'Loaded: ',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black,
                        fontSize: Helpers.responsiveHeight(12, context),
                      ),
                ),
                Text(
                  loaded > 999 ? '999+' : loaded.toString(),
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: grey,
                        fontSize: Helpers.responsiveHeight(12, context),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
