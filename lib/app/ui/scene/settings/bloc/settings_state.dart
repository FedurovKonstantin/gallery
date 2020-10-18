part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {
  final User user;

  SettingsInitial({this.user});
}

class SettingsLoading extends SettingsState {}

class SettingsSavedSuccess extends SettingsState {
  final User user;

  SettingsSavedSuccess({this.user});
}

class SettingsFailure extends SettingsState {
  final String e;

  SettingsFailure({this.e});
}

// class SettingsSignOut extends SettingsState {
//   final User user;

//   SettingsSignOut({this.user});
// }

// class SettingsEror extends SettingsState {
//   final User user;

//   SettingsEror({this.user});
// }
