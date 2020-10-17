import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/repository/firebase/firebase_auth.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc()
      : super(
          SignInInitial(),
        );

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is SignInCheckCredentials) {
      try {
        yield SignInLoading();
        User user = await FirebaseAuth().logInWithEmailAndPassword(
            email: event.email, password: event.password);
        if (user == null) {
          yield SignInFailed(e: 'user is null');
          return;
        }
        yield SignInSuccessfully(user: user);
      } catch (e) {
        yield SignInFailed(e: e.message.message);
      }
    }
  }
}
