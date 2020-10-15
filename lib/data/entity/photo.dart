import 'package:gallery/data/entity/category.dart';
import 'package:gallery/data/entity/tag.dart';

class Photo {
  String _title;
  String _description;
  String _imageUrl;
  DateTime _createdDate;
  int _viewCounter;
  String _creatorsEmail;
  Category _category;
  List<Tag> _tags;
  String get imageUrl => _imageUrl;
  Photo({
    String title,
    String description,
    String imageUrl,
    Category category,
    DateTime createdDate,
    int viewCounter,
    String creatorsEmail,
    List<Tag> tags,
  })  : _title = title,
        _tags = tags,
        _category = category,
        _description = description,
        _imageUrl = imageUrl,
        _createdDate = createdDate,
        _viewCounter = viewCounter,
        _creatorsEmail = creatorsEmail;

  Map<String, dynamic> toJson() {
    return {
      "title": _title,
      "description": _description,
      "imageUrl": _imageUrl,
      "createdDate": _createdDate,
      "viewCounter": _viewCounter,
      "category": _category.toString(),
      "creatorsEmail": _creatorsEmail,
      "tags": _tags
          ?.map(
            (e) => e.toJson(),
          )
          ?.toList(),
    };
  }
}
