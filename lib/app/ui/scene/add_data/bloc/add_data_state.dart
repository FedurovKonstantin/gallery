part of 'add_data_bloc.dart';

abstract class AddDataState extends Equatable {
  const AddDataState();

  @override
  List<Object> get props => [];
}

class AddDataInitial extends AddDataState {}

class AddDataFailure extends AddDataState {
  final String _error;
  AddDataFailure({
    String error,
  }) : _error = error;
}

class AddDataSuccess extends AddDataState {
  final String _name;
  final String _description;
  final List<Tag> _tags;
  final String _path;

  AddDataSuccess({
    String name,
    String description,
    List<Tag> tags,
    String path,
  })  : _tags = tags,
        _name = name,
        _description = description,
        _path = path;

  @override
  List<Object> get props => [_name, _description, _path, _tags];
}
