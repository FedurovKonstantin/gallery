import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/repository/firebase/firebase_auth.dart';
import 'package:gallery/repository/firebase/firebase_database.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpCheckCredentials) {
      try {
        yield SignUpLoading();
        User user = await FirebaseAuth().signUp(
          email: event.email,
          password: event.password,
          name: event.name,
          birthday: event.birthday,
        );
        yield SignUpSuccessfully(
          user: user,
        );
        //await _authenticationRepository.logInWithEmailAndPassword(
        //  email: event.email, password: event.password);
      } catch (e) {
        yield SignUpFailed(e: e.message.message);
      }
    }
  }
}
