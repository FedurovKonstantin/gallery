part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInCheckCredentials extends SignInEvent {
  String email;
  String password;
  SignInCheckCredentials({this.email, this.password});
  @override
  // TODO: implement props
  List<Object> get props => [email, password];
}

class SignInCheckUserStatus extends SignInEvent {
  User user;
  SignInCheckUserStatus({this.user});
  @override
  // TODO: implement props
  List<Object> get props => [user];
}
