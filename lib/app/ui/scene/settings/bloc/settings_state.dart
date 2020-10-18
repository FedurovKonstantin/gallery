part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {
  final User user;

  final String e;
  SettingsInitial({this.user, this.e});
}

class SettingsLoading extends SettingsState {}

class SettingsSavedSuccess extends SettingsState {
  final User user;
  final String e;

  SettingsSavedSuccess({this.user, this.e});
}

class SettingsFailure extends SettingsState {}

// class SettingsSignOut extends SettingsState {
//   final User user;

//   SettingsSignOut({this.user});
// }

// class SettingsEror extends SettingsState {
//   final User user;

//   SettingsEror({this.user});
// }
