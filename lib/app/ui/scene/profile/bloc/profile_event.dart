part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileFetchPhotos extends ProfileEvent {
  final User user;

  ProfileFetchPhotos({this.user});
  @override
  // TODO: implement props
  List<Object> get props => [user];
}
