class Category {
  final String _title;
  Category({
    String title,
  }) : _title = title;
  Map<String, dynamic> toJson() {
    return {
      "title": _title,
    };
  }
}
