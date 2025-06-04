import 'package:dartz/dartz.dart';
import 'package:patagonian_employees_app/login/domain/domain.dart';

abstract class UsersRepository {
  Future<Either<Exception, User>> getUser(String userId);

  Future<Either<Exception, User>> getUserByEmailAndPassword(String email, String password);

  Future<Either<Exception, User>> createUser(String email, String password);

  Future<Either<Exception, void>> updateUser(User user);

  Future<Either<Exception, void>> deleteUser(String userId);
}
