part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsSave extends SettingsEvent {
  final String name;
  final String birthday;
  final String email;
  final String password;
  final String imageUrl;
  final String id;
  final File photo;
  final String oldPassword;
  final String oldEmail;
  final bool localImage;

  SettingsSave({
    this.name,
    this.birthday,
    this.localImage,
    this.email,
    this.oldEmail,
    this.id,
    this.password,
    this.oldPassword,
    this.imageUrl,
    this.photo,
  });
  @override
  // TODO: implement props
  List<Object> get props =>
      [name, birthday, email, password, imageUrl, id, oldEmail, oldPassword];
}

// class SettingsSignOut extends SettingsEvent {
//   final User user;

//   SettingsSignOut({this.user});
// }

class SettingsDelete extends SettingsEvent {}
