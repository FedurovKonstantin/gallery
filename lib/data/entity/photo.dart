import 'package:gallery/data/entity/category.dart';

class Photo {
  String _title;
  String _description;
  String _imageUrl;
  DateTime _createdDate;
  int _viewCounter;
  String _creatorsEmail;
  List<Category> _categories;
  String get imageUrl => _imageUrl;
  Photo({
    String title,
    String description,
    String imageUrl,
    DateTime createdDate,
    int viewCounter,
    String creatorsEmail,
    List<Category> categories,
  })  : _title = title,
        _categories = categories,
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
      "creatorsEmail": _creatorsEmail,
      "categories": _categories
          ?.map(
            (e) => e.toJson(),
          )
          ?.toList(),
    };
  }
}
