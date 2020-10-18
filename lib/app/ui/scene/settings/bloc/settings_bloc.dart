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
    if (event is SettingsDelete) {
      yield SettingsLoading();
    }
    if (event is SettingsSave) {
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
      try {
        await FirebaseAuth().updateEmail(
          email: event.oldEmail,
          password: event.oldPassword,
          newEmail: event.email,
        );
        String pass;
        if (!event.password.isEmpty) {
          pass = event.password;
          await FirebaseAuth().updatePassword(
            email: event.oldEmail,
            password: event.oldPassword,
            newPassword: event.password,
          );
        } else {
          pass = event.oldPassword;
        }

        await FirebaseDatabase(uid: event.id).updateUserData(
          event.name,
          pass,
          event.email,
          event.birthday,
          imageUrl,
        );
        await FirebaseDatabase(uid: event.id).updateEmailsbyPhoto(
          email: event.oldEmail,
          newEmail: event.email,
        );
        yield SettingsSavedSuccess(
          user: User(
            email: event.email,
            birthday: event.birthday,
            password: pass,
            imageUrl: imageUrl,
            id: event.id,
            name: event.name,
          ),
        );
      } catch (e) {
        yield SettingsSavedSuccess(
          user: User(
            email: event.email,
            birthday: event.birthday,
            password: event.oldPassword,
            imageUrl: imageUrl,
            id: event.id,
            name: event.name,
          ),
          e: e.toString(),
        );
      }
    }
  }
}
