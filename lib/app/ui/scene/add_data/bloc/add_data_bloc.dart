import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gallery/data/entity/category.dart';
import 'package:gallery/data/entity/photo.dart';
import 'package:gallery/data/entity/tag.dart';
import 'package:gallery/repository/firebase/firebase_database.dart';

part 'add_data_event.dart';
part 'add_data_state.dart';

class AddDataBloc extends Bloc<AddDataEvent, AddDataState> {
  AddDataBloc() : super(AddDataInitial());

  @override
  Stream<AddDataState> mapEventToState(
    AddDataEvent event,
  ) async* {
    if (event is AddPhoto) {
      yield AddDataLoading();
      try {
        var name = event.photo.path.split('/').last;
        final _storage = FirebaseStorage.instance;
        var snapshot = await _storage
            .ref()
            .child('images/$name')
            .putFile(event.photo)
            .onComplete;

        String dowloadedUrl = await snapshot.ref.getDownloadURL();
        await FirebaseDatabase().addPhoto(
          Photo(
            title: event.name,
            creatorsEmail: event.email,
            imageUrl: dowloadedUrl,
            id: DateTime.now().toUtc().toString(),
            category: [Category(title: 'New')],
            tags: event.tags,
            createdDate: DateTime.now(),
            viewCounter: 0,
            description: event.description,
          ),
        );
        yield AddDataSuccess();
      } catch (e) {
        throw AddDataFailure(error: e);
      }
    }
  }
}
