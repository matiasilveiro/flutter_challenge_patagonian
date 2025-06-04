import 'package:patagonian_employees_app/core/core.dart';
import 'package:patagonian_employees_app/login/domain/domain.dart';

extension EmployeeToUserMapper on EmployeeDto {
  User toUser() {
    return User(
      id: id,
      name: name,
      email: email,
    );
  }
}
