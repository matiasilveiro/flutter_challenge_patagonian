import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:patagonian_employees_app/core/core.dart';
import 'package:patagonian_employees_app/login/domain/domain.dart';

@injectable
class SignInUseCase {
  final UsersRepository _repository;

  SignInUseCase(this._repository);

  Future<Either<Exception, User>> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return Left(
        InvalidCredentialsException('Email and password cannot be empty'),
      );
    }

    return _repository.getUserByEmailAndPassword(email, password);
  }
}
