part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class MainFetchPhotos extends MainEvent {
  String filter;

  MainFetchPhotos({this.filter = ""});

  @override
  // TODO: implement props
  List<Object> get props => [filter];
}
