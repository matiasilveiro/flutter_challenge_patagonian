import 'package:floor/floor.dart';

@Entity(
  tableName: 'employees',
  indices: [
    Index(value: ['email'], unique: true)
  ],
)
class EmployeeDto {
  @primaryKey
  final int id;
  final String email;
  final String password;
  final String name;
  @ColumnInfo(name: 'job_title')
  final String jobTitle;

  EmployeeDto({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.jobTitle,
  });

  factory EmployeeDto.fromJson(Map<String, dynamic> json) {
    return EmployeeDto(
      id: json['id'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      jobTitle: json['job_title'] as String,
    );
  }
}
