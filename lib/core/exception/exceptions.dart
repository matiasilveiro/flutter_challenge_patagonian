class UserNotFoundException implements Exception {
  final String message;

  UserNotFoundException([this.message = 'User not found']);

  @override
  String toString() => 'UserNotFoundException: $message';
}

class InvalidCredentialsException implements Exception {
  final String message;

  InvalidCredentialsException([this.message = 'Invalid credentials']);

  @override
  String toString() => 'InvalidCredentialsException: $message';
}

class EmployeeNotFoundException implements Exception {
  final String message;

  EmployeeNotFoundException([this.message = 'Employee not found']);

  @override
  String toString() => 'EmployeeNotFoundException: $message';
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException([this.message = 'Unauthorized access']);

  @override
  String toString() => 'UnauthorizedException: $message';
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException([this.message = 'Database error occurred']);

  @override
  String toString() => 'DatabaseException: $message';
}

class UnimplementedException implements Exception {
  final String message;

  UnimplementedException([this.message = 'This method is not implemented']);

  @override
  String toString() => 'UnimplementedException: $message';
}
