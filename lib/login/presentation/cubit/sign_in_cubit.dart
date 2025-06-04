import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:patagonian_employees_app/login/domain/domain.dart';
import 'package:patagonian_employees_app/login/presentation/cubit/sign_in_state.dart';
import 'package:patagonian_employees_app/login/presentation/model/credentials.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;

  SignInCubit(this._signInUseCase) : super(SignInState());

  Future<void> signIn(LoginCredentials credentials) async {
    if (!credentials.isValid) {
      emit(SignInState(
        errorMessage: 'Please fill in all fields correctly.',
      ));
      return;
    }

    emit(SignInState(isLoading: true));

    final result = await _signInUseCase(
      credentials.email,
      credentials.password,
    );
    result.fold(
      (exception) {
        emit(SignInState(
          isLoading: false,
          errorMessage: exception.toString(),
        ));
      },
      (user) {
        emit(SignInState(
          isLoading: false,
          user: user,
        ));
      },
    );
  }
}
