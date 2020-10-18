class User {
  String id;
  String email;
  String birthday;
  String password;
  String name;
  String imageUrl;

  User({
    this.email,
    this.id,
    this.name,
    this.birthday,
    this.password,
    this.imageUrl,
  });

  factory User.fromJson({Map<String, dynamic> json}) {
    return User(
      email: json["email"],
      id: json["id"],
      name: json["name"],
      password: json["password"],
      birthday: json["birthday"],
      imageUrl: json["imageUrl"],
    );
  }
}
