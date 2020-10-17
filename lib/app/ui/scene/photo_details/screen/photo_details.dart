import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/resources/app_colors.dart';
import 'package:gallery/app/ui/scene/photo_details/bloc/photo_details_bloc.dart';
import 'package:gallery/app/ui/scene/photo_details/widget/details_data_tag.dart';
import 'package:gallery/app/ui/scene/photo_details/widget/details_photo_app_bar.dart';
import 'package:gallery/app/ui/scene/photo_details/widget/details_photo_image.dart';
import 'package:gallery/app/ui/scene/photo_details/widget/details_photo_title_bloc.dart';
import 'package:gallery/data/entity/photo.dart';
import 'package:gallery/data/utils/helpers.dart';

class PhotoDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsPhotoAppBar(),
      body: SingleChildScrollView(
        child: BlocConsumer<PhotoDetailsBloc, PhotoDetailsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is PhotoDetailsSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DetailsPhotoImage(
                    imageUrl: state.photo.imageUrl,
                  ),
                  SizedBox(
                    height: Helpers.responsiveHeight(11, context),
                  ),
                  DetailsPhotoTitleBloc(
                    name: state.photo.creatorsEmail,
                    createdTime: state.photo.createdDate,
                    views: state.photo.viewCounter,
                    title: state.photo.title,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Helpers.responsiveWidth(16, context)),
                    child: Text(
                      state.photo.description,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black,
                          fontSize: Helpers.responsiveHeight(15, context)),
                    ),
                  ),
                  SizedBox(
                    height: Helpers.responsiveHeight(16, context),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Helpers.responsiveWidth(16, context)),
                    child: Wrap(
                      spacing: Helpers.responsiveWidth(8, context),
                      runSpacing: Helpers.responsiveHeight(9, context),
                      children: state.photo.tags
                          .map((e) => DetailsDataTag(
                                title: e.title,
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: Helpers.responsiveHeight(16, context),
                  ),
                ],
              );
            }
            if (state is PhotoDetailsInitial) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 1,
                      valueColor: new AlwaysStoppedAnimation<Color>(grey),
                    ),
                    SizedBox(
                      height: Helpers.responsiveHeight(10, context),
                    ),
                    Text(
                      'Loading...',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: Helpers.responsiveHeight(17, context),
                            color: grey,
                          ),
                    ),
                  ],
                ),
              );
            }
            if (state is PhotoDetailsError) {
              return Center(
                child: Text(state.e),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
