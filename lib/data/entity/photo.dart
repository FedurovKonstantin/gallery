import 'package:gallery/data/entity/category.dart';
import 'package:gallery/data/entity/tag.dart';

class Photo {
  String title;
  String description;
  String imageUrl;
  DateTime createdDate;
  int viewCounter;
  String creatorsEmail;
  Category category;
  List<Tag> tags;

  Photo({
    this.title,
    this.description,
    this.imageUrl,
    this.category,
    this.createdDate,
    this.viewCounter,
    this.creatorsEmail,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "imageUrl": imageUrl,
      "createdDate": createdDate,
      "viewCounter": viewCounter,
      "category": category.toString(),
      "creatorsEmail": creatorsEmail,
      "tags": tags
          ?.map(
            (e) => e.toJson(),
          )
          ?.toList(),
    };
  }
}
