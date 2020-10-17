part of 'add_data_bloc.dart';

abstract class AddDataEvent extends Equatable {
  const AddDataEvent();

  @override
  List<Object> get props => [];
}

class AddTag extends AddDataEvent {
  final String title;
  AddTag({
    this.title,
  });

  @override
  List<Object> get props => [title];
}

class AddPhoto extends AddDataEvent {
  final String name;
  final String description;
  final List<Tag> tags;
  final File photo;
  final String email;
  AddPhoto({
    this.name,
    this.description,
    this.tags,
    this.photo,
    this.email,
  });

  @override
  // TODO: implement props
  List<Object> get props => [name, description, photo, tags, email];
}
