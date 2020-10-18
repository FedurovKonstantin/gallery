import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/data/entity/photo.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/repository/firebase/firebase_database.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileFetchPhotos) {
      try {
        yield ProfileInitial();
        User user =
            await FirebaseDatabase(uid: event.user.id).getUserDataById();
        List<Photo> photos = await FirebaseDatabase().getPhotosbyUsersId(
          id: user.id,
        );
        int loaded = photos.length;

        yield ProfileSuccess(
          loaded: loaded,
          photos: photos,
          user: user,
        );
      } catch (e) {
        yield ProfileFailure(e: e.toString());
      }
    }
  }
}
