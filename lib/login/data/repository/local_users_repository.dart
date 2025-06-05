import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:patagonian_employees_app/core/core.dart';
import 'package:patagonian_employees_app/login/data/mapper/user_mapper.dart';
import 'package:patagonian_employees_app/login/domain/domain.dart';

@Injectable(as: UsersRepository)
class LocalUsersRepositoryImpl implements UsersRepository {
  LocalUsersRepositoryImpl(this._employeeDao);

  final EmployeeDao _employeeDao;

  @override
  Future<Either<Exception, User>> getUser(String userId) async {
    // TODO: implement getUser
    return Left(UnimplementedException());
  }

  @override
  Future<Either<Exception, User>> getUserByEmailAndPassword(
    String email,
    String password,
  ) {
    return Future.delayed(const Duration(seconds: 1), () async {
      try {
        final employeeDto =
            await _employeeDao.findByEmailAndPassword(email, password);
        if (employeeDto == null) {
          return Left(
            UserNotFoundException(
                'User with email $email not found or invalid credentials'),
          );
        }
        return Right(employeeDto.toUser());
      } catch (e) {
        return Left(Exception('Failed to fetch user'));
      }
    });
  }

  @override
  Future<Either<Exception, User>> createUser(
      String email, String password) async {
    // TODO: implement createUser
    return Left(UnimplementedException());
  }

  @override
  Future<Either<Exception, void>> updateUser(User user) async {
    // TODO: implement updateUser
    return Left(UnimplementedException());
  }

  @override
  Future<Either<Exception, void>> deleteUser(String userId) async {
    // TODO: implement deleteUser
    return Left(UnimplementedException());
  }
}
