part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInFailed extends SignInState {
  String e;
  SignInFailed({this.e});
}

class SignInSuccessfully extends SignInState {
  User user;
  SignInSuccessfully({this.user});
}
