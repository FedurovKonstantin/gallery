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
  final bool localImage;

  SettingsSave({
    this.name,
    this.birthday,
    this.localImage,
    this.email,
    this.id,
    this.password,
    this.imageUrl,
    this.photo,
  });
  @override
  // TODO: implement props
  List<Object> get props => [name, birthday, email, password, imageUrl, id];
}

// class SettingsSignOut extends SettingsEvent {
//   final User user;

//   SettingsSignOut({this.user});
// }

// class SettingsDelete extends SettingsEvent {
//   final User user;

//   SettingsDelete({this.user});
// }
