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

  static const empty = User(id: '');
}
