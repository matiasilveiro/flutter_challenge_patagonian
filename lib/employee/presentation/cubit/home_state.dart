import 'package:patagonian_employees_app/employee/domain/domain.dart';

class HomeState {
  final bool isLoading;
  final bool loggedOut;
  final String? errorMessage;
  final Employee? employee;

  HomeState({
    this.isLoading = false,
    this.loggedOut = false,
    this.errorMessage,
    this.employee,
  });

  T when<T>({
    required T Function() loading,
    required T Function(String message) error,
    required T Function(Employee employee) success,
  }) {
    if (isLoading) {
      return loading();
    } else if (errorMessage != null) {
      return error(errorMessage!);
    } else if (employee != null) {
      return success(employee!);
    } else {
      return loading();
    }
  }
}
