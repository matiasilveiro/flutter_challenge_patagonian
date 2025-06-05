
import 'package:patagonian_employees_app/core/core.dart';
import 'package:patagonian_employees_app/employee/domain/domain.dart';

extension EmployeeMapper on EmployeeDto {
  Employee toDomain() {
    return Employee(
      id: id,
      name: name,
      email: email,
      jobTitle: jobTitle,
    );
  }
}
