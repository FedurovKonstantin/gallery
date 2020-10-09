import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/repository/firebase/firebase_auth.dart';
import 'package:gallery/repository/firebase/firebase_database.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  StreamSubscription<User> _userSubscription;
  FirebaseAuth _authenticationRepository;
  SignUpBloc({
    FirebaseAuth authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          SignUpInitial(),
        ) {
    _userSubscription = _authenticationRepository.user?.listen((user) {
      print(1);
      add(
        SignUpCheckUserStatus(user: user),
      );
    });
  }
  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpCheckUserStatus) {
      if (event.user == null) {
        yield SignUpFailed();
      } else {
        yield SignUpSuccessfully(user: event.user);
      }
    }
    if (event is SignUpCheckCredentials) {
      try {
        yield SignUpLoading();
        await _authenticationRepository.signUp(
          email: event.email,
          password: event.password,
          name: event.name,
          birthday: event.birthday,
        );
        //await _authenticationRepository.logInWithEmailAndPassword(
        //  email: event.email, password: event.password);
      } catch (e) {
        yield SignUpFailed(e: e.message.message);
      }
    }
  }
}
