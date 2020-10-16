class User {
  final String id;
  final String email;
  final String birthday;
  final String password;
  final String name;

  const User({
    this.email,
    this.id,
    this.name,
    this.birthday,
    this.password,
  });

  factory User.fromJson({Map<String, dynamic> json}) {
    return User(
        email: json["email"],
        id: json["id"],
        name: json["name"],
        password: json["password"],
        birthday: json["birthday"]);
  }
}
