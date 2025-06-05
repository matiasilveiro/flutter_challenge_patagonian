import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:patagonian_employees_app/core/core.dart';
import 'package:patagonian_employees_app/employee/domain/domain.dart';

@injectable
class GetCurrentEmployeeUseCase {
  final EmployeeRepository _employeeRepository;
  final PreferencesManager _preferencesManager;

  GetCurrentEmployeeUseCase(
    this._employeeRepository,
    this._preferencesManager,
  );

  Future<Either<Exception, Employee>> call() async {
    final employeeId = await _preferencesManager.getUserId();
    if (employeeId == null) {
      return Left(UnauthorizedException('No current employee found'));
    }

    return _employeeRepository.getEmployeeById(int.parse(employeeId));
  }
}
