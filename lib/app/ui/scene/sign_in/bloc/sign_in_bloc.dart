import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/data/entity/user.dart';
import 'package:gallery/repository/firebase/firebase_auth.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  StreamSubscription<User> _userSubscription;
  FirebaseAuth _authenticationRepository;
  SignInBloc({
    FirebaseAuth authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          SignInInitial(),
        ) {
    _userSubscription = _authenticationRepository.user?.listen((user) {
      print(10);
      add(
        SignInCheckUserStatus(user: user),
      );
    });
  }
  @override
  Future<void> close() {
    _userSubscription?.cancel();
    print(1);
    return super.close();
  }

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is SignInCheckUserStatus) {
      yield event.user == null
          ? SignInFailed()
          : SignInSuccessfully(user: event.user);
    }
    if (event is SignInCheckCredentials) {
      try {
        yield SignInLoading();
        await _authenticationRepository.logInWithEmailAndPassword(
            email: event.email, password: event.password);
      } catch (e) {
        yield SignInFailed(e: e.message.message);
      }
    }
  }
}
