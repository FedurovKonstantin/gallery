import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/resources/app_colors.dart';

class UserPhoto extends StatelessWidget {
  final String imageUrl;

  UserPhoto({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: grey),
        shape: BoxShape.circle,
      ),
      child: imageUrl == null
          ? Center(
              child: Image.asset(
                'assets/profile_back.png',
                color: iconGrey,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(imageUrl),
                ),
              ),
              // child: CachedNetworkImage(
              //     imageUrl: imageUrl,
              //     fit: BoxFit.fill,
              //     placeholder: (context, url) => Image.asset(
              //       'assets/profile_back.png',
              //       color: iconGrey,
              //     ),
              //   ),
            ),
    );
  }
}
