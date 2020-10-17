import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery/data/utils/helpers.dart';

class DetailsPhotoImage extends StatelessWidget {
  final String imageUrl;
  DetailsPhotoImage({this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.fill,
      width: Helpers.responsiveWidth(375, context),
      height: Helpers.responsiveHeight(251, context),
      placeholder: (context, url) => Image.asset('assets/intersect_grey.png'),
    );
  }
}
