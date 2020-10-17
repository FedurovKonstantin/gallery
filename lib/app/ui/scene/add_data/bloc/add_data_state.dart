part of 'add_data_bloc.dart';

abstract class AddDataState extends Equatable {
  const AddDataState();

  @override
  List<Object> get props => [];
}

class AddDataInitial extends AddDataState {}

class AddDataLoading extends AddDataState {}

class AddDataFailure extends AddDataState {
  final String error;
  AddDataFailure({
    this.error,
  });
  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class AddDataSuccess extends AddDataState {
  @override
  List<Object> get props => [];
}
