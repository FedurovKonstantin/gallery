part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final List<Photo> photos;
  final int views;
  final User user;
  final int loaded;

  ProfileSuccess({
    this.photos,
    this.loaded,
    this.user,
    this.views,
  });

  @override
  List<Object> get props => [photos, views, loaded, user];
}

class ProfileLoading extends ProfileState {}

class ProfileFailure extends ProfileState {
  final String e;
  ProfileFailure({this.e});
  @override
  // TODO: implement props
  List<Object> get props => [e];
}
