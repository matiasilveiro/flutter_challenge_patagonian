import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:patagonian_employees_app/core/core.dart';

@injectable
class SignOutUseCase {
  final PreferencesManager _preferencesManager;

  SignOutUseCase(this._preferencesManager);

  Future<Either<Exception, void>> call() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => _preferencesManager.clearUserId().then(
            (_) => const Right(null),
            onError: (error) => Left(Exception('Failed to sign out: $error')),
          ),
    );
  }
}
