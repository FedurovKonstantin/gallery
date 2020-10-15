class Tag {
  final String _title;
  Tag({
    String title,
  }) : _title = title;
  Map<String, dynamic> toJson() {
    return {
      "title": _title,
    };
  }
}
