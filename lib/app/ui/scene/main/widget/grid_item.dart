import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/scene/photo_details/bloc/photo_details_bloc.dart';
import 'package:gallery/app/ui/scene/photo_details/screen/photo_details.dart';
import 'package:gallery/data/entity/photo.dart';

class GridItem extends StatelessWidget {
  final Photo photo;

  GridItem({this.photo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => PhotoDetailsBloc()
                ..add(
                  PhotoDetailsInitEvent(photo: photo),
                ),
              child: PhotoDetails(),
            );
          },
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: CachedNetworkImage(
          imageUrl: photo.imageUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              Image.asset('assets/intersect_grey.png'),
        ),
      ),
    );
  }
}
