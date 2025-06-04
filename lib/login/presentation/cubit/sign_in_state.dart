import 'package:patagonian_employees_app/login/domain/domain.dart';

class SignInState {
  final bool isLoading;
  final String? errorMessage;
  final User? user;

  SignInState({
    this.isLoading = false,
    this.errorMessage,
    this.user,
  });
}
