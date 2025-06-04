class User {
  final int id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email}';
  }
}
