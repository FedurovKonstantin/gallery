import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/data/entity/category.dart';
import 'package:gallery/data/entity/photo.dart';
import 'package:gallery/repository/firebase/firebase_database.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial());

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is MainFetchPhotos) {
      try {
        yield MainInitial();
        List<Photo> _newPhotos = await FirebaseDatabase().getPhotos(
          category: Category(title: "New"),
        );
        List<Photo> _popularPhotos = await FirebaseDatabase().getPhotos(
          category: Category(title: "Popular"),
        );
        if (event.filter.trim().length != 0) {
          _newPhotos = _newPhotos
              .where((element) => element.title.contains(event.filter))
              .toList();
          _popularPhotos = _popularPhotos
              .where((element) => element.title.contains(event.filter))
              .toList();
        }
        yield MainSuccess(
          newPhotos: _newPhotos,
          popularPhotos: _popularPhotos,
        );
      } catch (e) {
        yield MainFailure(e: e.toString());
      }
    }
  }
}
