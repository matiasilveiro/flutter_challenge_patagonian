import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:patagonian_employees_app/core/core.dart';
import 'package:patagonian_employees_app/login/domain/domain.dart';

@injectable
class SignInUseCase {
  final UsersRepository _repository;
  final PreferencesManager _preferencesManager;

  SignInUseCase(this._repository, this._preferencesManager);

  Future<Either<Exception, User>> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return Left(
        InvalidCredentialsException('Email and password cannot be empty'),
      );
    }

    return _repository.getUserByEmailAndPassword(email, password).then(
      (result) async {
        return result.fold(
          (exception) => Left(exception),
          (user) async {
            await _preferencesManager.setUserId(user.id.toString());
            return Right(user);
          },
        );
      },
    );
  }
}
