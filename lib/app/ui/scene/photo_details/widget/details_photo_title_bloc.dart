import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/data/utils/helpers.dart';

class DetailsPhotoTitleBloc extends StatelessWidget {
  final String name;
  final String title;
  final int views;
  final String createdTime;

  DetailsPhotoTitleBloc({
    this.createdTime,
    this.name,
    this.title,
    this.views,
  });
  String getData() {
    List<String> s = createdTime.split(' ').first.split('-');
    return s.last + "." + s[1] + "." + s.first;
  }

  @override
  Widget build(BuildContext context) {
    print(createdTime);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Helpers.responsiveWidth(16, context),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Helpers.responsiveWidth(290, context),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black,
                        fontSize: Helpers.responsiveHeight(20, context),
                      ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    views > 999 ? "999+" : views.toString(),
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: grey,
                          fontSize: Helpers.responsiveHeight(12, context),
                        ),
                  ),
                  SizedBox(
                    width: Helpers.responsiveWidth(5, context),
                  ),
                  Icon(
                    Icons.remove_red_eye,
                    color: grey,
                    size: Helpers.responsiveHeight(12, context),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Helpers.responsiveHeight(10, context),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: grey,
                      fontSize: Helpers.responsiveHeight(15, context),
                    ),
              ),
              Text(
                getData(),
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: grey,
                      fontSize: Helpers.responsiveHeight(15, context),
                    ),
              ),
            ],
          ),
          SizedBox(
            height: Helpers.responsiveHeight(17, context),
          ),
        ],
      ),
    );
  }
}
