import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/repository/firebase/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/repository/firebase/firebase_database.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsSave) {
      try {
        yield SettingsLoading();
        String imageUrl;
        if (event.photo != null) {
          var name = event.photo.path.split('/').last;
          final _storage = FirebaseStorage.instance;
          var snapshot = await _storage
              .ref()
              .child('images/$name')
              .putFile(event.photo)
              .onComplete;

          imageUrl = await snapshot.ref.getDownloadURL();
        } else {
          imageUrl = event.imageUrl;
        }
        await FirebaseDatabase(uid: event.id).updateUserData(
          event.name,
          event.password,
          event.email,
          event.birthday,
          imageUrl,
        );

        await FirebaseAuth().updateEmail(email: event.email);
        if (!event.password.isEmpty) {
          await FirebaseAuth().updatePassword(password: event.password);
        }
        yield SettingsSavedSuccess(
          user: User(
            email: event.email,
            birthday: event.birthday,
            password: event.password,
            imageUrl: imageUrl,
            id: event.id,
            name: event.name,
          ),
        );
      } catch (e) {
        throw SettingsFailure(e: e);
      }
    }
  }
}
