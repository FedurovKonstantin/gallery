import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_data_event.dart';
part 'add_data_state.dart';

class AddDataBloc extends Bloc<AddDataEvent, AddDataState> {
  AddDataBloc() : super(AddDataInitial());

  @override
  Stream<AddDataState> mapEventToState(
    AddDataEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
