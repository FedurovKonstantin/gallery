import 'package:gallery/data/entity/category.dart';
import 'package:gallery/data/entity/tag.dart';

class Photo {
  String title;
  String description;
  String imageUrl;
  String createdDate;
  int viewCounter;
  String id;
  String creatorsEmail;
  String creatorsId;
  List<Category> category;
  List<Tag> tags;

  Photo({
    this.title,
    this.description,
    this.imageUrl,
    this.id,
    this.creatorsId,
    this.category,
    this.createdDate,
    this.viewCounter,
    this.creatorsEmail,
    this.tags,
  });
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      title: json["title"],
      description: json["description"],
      imageUrl: json["imageUrl"],
      id: json["id"],
      creatorsId: json["creatorsId"],
      category: (json["category"] as List<dynamic>)
          .map((e) => Category(title: e))
          .toList(),
      createdDate: json["createdDate"],
      viewCounter: json["viewCounter"],
      creatorsEmail: json["creatorsEmail"],
      tags: (json["tags"] as List<dynamic>)
          .map(
            (e) => Tag(title: e),
          )
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "imageUrl": imageUrl,
      "id": id,
      "creatorsId": creatorsId,
      "createdDate": createdDate,
      "viewCounter": viewCounter,
      "category": category
          .map(
            (e) => e.toString(),
          )
          .toList(),
      "creatorsEmail": creatorsEmail,
      "tags": tags
          ?.map(
            (e) => e.toString(),
          )
          ?.toList(),
    };
  }
}
