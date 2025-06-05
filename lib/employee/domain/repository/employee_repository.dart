import 'package:dartz/dartz.dart';
import 'package:patagonian_employees_app/employee/domain/domain.dart';

abstract class EmployeeRepository {
  Future<Either<Exception, Employee>> getEmployeeById(int id);
}
