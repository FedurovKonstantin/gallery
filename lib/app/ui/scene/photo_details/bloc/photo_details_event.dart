part of 'photo_details_bloc.dart';

abstract class PhotoDetailsEvent extends Equatable {
  const PhotoDetailsEvent();

  @override
  List<Object> get props => [];
}

class PhotoDetailsInitEvent extends PhotoDetailsEvent {
  final Photo photo;

  PhotoDetailsInitEvent({this.photo});
  @override
  // TODO: implement props
  List<Object> get props => [photo];
}
