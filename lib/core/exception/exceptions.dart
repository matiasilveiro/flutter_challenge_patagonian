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

class UnimplementedException implements Exception {
  final String message;

  UnimplementedException([this.message = 'This method is not implemented']);

  @override
  String toString() => 'UnimplementedException: $message';
}
