import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:patagonian_employees_app/core/core.dart';
import 'package:patagonian_employees_app/employee/data/mapper/employee_mapper.dart';
import 'package:patagonian_employees_app/employee/domain/domain.dart';

@Injectable(as: EmployeeRepository)
class LocalEmployeeRepository implements EmployeeRepository {
  final EmployeeDao _employeeDao;

  LocalEmployeeRepository(this._employeeDao);

  @override
  Future<Either<Exception, Employee>> getEmployeeById(int id) async {
    return Future.delayed(const Duration(seconds: 1), () async {
      try {
        final employeeDto = await _employeeDao.findById(id);
        if (employeeDto == null) {
          return Left(UserNotFoundException('Employee with id $id not found'));
        }
        return Right(employeeDto.toDomain());
      } catch (e) {
        return Left(Exception('Failed to fetch employee: $e'));
      }
    });
  }
}
