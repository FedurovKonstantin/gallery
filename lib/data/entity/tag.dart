class Tag {
  final String title;
  Tag({
    this.title,
  });
  Map<String, dynamic> toJson() {
    return {
      "title": title,
    };
  }
}
