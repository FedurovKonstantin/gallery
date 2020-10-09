part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpFailed extends SignUpState {
  String e;
  SignUpFailed({this.e});
}

class SignUpSuccessfully extends SignUpState {
  User user;
  SignUpSuccessfully({this.user});
}
