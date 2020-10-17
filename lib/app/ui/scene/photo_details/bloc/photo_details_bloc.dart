import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/data/entity/category.dart';
import 'package:gallery/data/entity/photo.dart';
import 'package:gallery/repository/firebase/firebase_database.dart';

part 'photo_details_event.dart';
part 'photo_details_state.dart';

class PhotoDetailsBloc extends Bloc<PhotoDetailsEvent, PhotoDetailsState> {
  PhotoDetailsBloc() : super(PhotoDetailsInitial());

  @override
  Stream<PhotoDetailsState> mapEventToState(
    PhotoDetailsEvent event,
  ) async* {
    if (event is PhotoDetailsInitEvent) {
      try {
        yield PhotoDetailsInitial();
        Photo photo = event.photo;
        photo.viewCounter += 1;
        if (photo.viewCounter > 10) {
          photo.category.add(
            Category(title: "Popular"),
          );
        }
        await FirebaseDatabase().addPhoto(photo);
        yield PhotoDetailsSuccess(photo: photo);
      } catch (e) {
        PhotoDetailsError(e: e);
      }
    }
  }
}
