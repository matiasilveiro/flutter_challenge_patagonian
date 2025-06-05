import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:patagonian_employees_app/employee/domain/domain.dart';
import 'package:patagonian_employees_app/employee/presentation/presentation.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetCurrentEmployeeUseCase _getCurrentEmployeeUseCase;
  final SignOutUseCase _signOutUseCase;

  HomeCubit(
    this._getCurrentEmployeeUseCase,
    this._signOutUseCase,
  ) : super(HomeState());

  Future<void> getCurrentEmployee() async {
    emit(HomeState(isLoading: true));

    final result = await _getCurrentEmployeeUseCase();
    result.fold(
      (exception) {
        emit(HomeState(
          isLoading: false,
          errorMessage: exception.toString(),
        ));
      },
      (employee) {
        emit(HomeState(
          isLoading: false,
          employee: employee,
        ));
      },
    );
  }

  Future<void> signOut() async {
    emit(HomeState(isLoading: true));

    final result = await _signOutUseCase();
    result.fold(
      (exception) {
        emit(HomeState(
          isLoading: false,
          errorMessage: exception.toString(),
        ));
      },
      (_) {
        emit(HomeState(loggedOut: true));
      },
    );
  }
}
