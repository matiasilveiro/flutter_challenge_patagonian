import 'package:floor/floor.dart';
import 'package:patagonian_employees_app/core/database/database.dart';

@dao
abstract class EmployeeDao {
  @Query('SELECT * FROM employees')
  Future<List<EmployeeDto>> findAll();

  @Query('SELECT * FROM employees WHERE id = :id')
  Future<EmployeeDto?> findById(int id);

  @insert
  Future<void> insertEmployee(EmployeeDto employee);

  @update
  Future<void> updateEmployee(EmployeeDto employee);

  @delete
  Future<void> deleteEmployee(EmployeeDto employee);

  @Query(
    'SELECT * FROM employees WHERE email = :email AND password = :password',
  )
  Future<EmployeeDto?> findByEmailAndPassword(String email, String password);
}
