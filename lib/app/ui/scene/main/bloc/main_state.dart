part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainSuccess extends MainState {
  final List<Photo> newPhotos;
  final List<Photo> popularPhotos;

  MainSuccess({
    this.newPhotos,
    this.popularPhotos,
  });

  @override
  List<Object> get props => [newPhotos, popularPhotos];
}

class MainLoading extends MainState {}

class MainFailure extends MainState {
  final String e;
  MainFailure({this.e});
  @override
  // TODO: implement props
  List<Object> get props => [e];
}
