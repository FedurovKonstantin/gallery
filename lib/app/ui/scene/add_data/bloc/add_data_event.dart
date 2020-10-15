part of 'add_data_bloc.dart';

abstract class AddDataEvent extends Equatable {
  const AddDataEvent();

  @override
  List<Object> get props => [];
}

class AddTag extends AddDataEvent {
  final String _title;
  AddTag({
    String title,
  }) : _title = title;

  @override
  List<Object> get props => [_title];
}

class AddPhoto extends AddDataEvent {
  final String _name;
  final String _description;
  final List<Tag> _tags;
  final String _path;
  AddPhoto({
    String name,
    String description,
    List<Tag> tags,
    String path,
  })  : _tags = tags,
        _name = name,
        _description = description,
        _path = path;

  @override
  // TODO: implement props
  List<Object> get props => [_name, _description, _path, _tags];
}
