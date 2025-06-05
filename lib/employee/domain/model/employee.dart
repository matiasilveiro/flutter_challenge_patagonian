class Employee {
  final int id;
  final String email;
  final String name;
  final String jobTitle;

  Employee({
    required this.id,
    required this.email,
    required this.name,
    required this.jobTitle,
  });

  String get initials {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return parts[0][0] + parts[1][0];
    } else {
      return name.substring(0, 1);
    }
  }
}
