part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpCheckCredentials extends SignUpEvent {
  String email;
  String password;
  String birthday;
  String name;
  SignUpCheckCredentials({
    this.email,
    this.password,
    this.birthday,
    this.name,
  });
  @override
  // TODO: implement props
  List<Object> get props => [email, password];
}

class SignUpCheckUserStatus extends SignUpEvent {
  User user;
  SignUpCheckUserStatus({this.user});
  @override
  // TODO: implement props
  List<Object> get props => [user];
}
