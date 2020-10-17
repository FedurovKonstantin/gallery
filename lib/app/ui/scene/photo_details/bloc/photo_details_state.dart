part of 'photo_details_bloc.dart';

abstract class PhotoDetailsState extends Equatable {
  const PhotoDetailsState();

  @override
  List<Object> get props => [];
}

class PhotoDetailsInitial extends PhotoDetailsState {}

class PhotoDetailsSuccess extends PhotoDetailsState {
  final Photo photo;
  PhotoDetailsSuccess({this.photo});
  @override
  // TODO: implement props
  List<Object> get props => [photo];
}

class PhotoDetailsError extends PhotoDetailsState {
  final String e;
  PhotoDetailsError({this.e});
  @override
  // TODO: implement props
  List<Object> get props => [e];
}
