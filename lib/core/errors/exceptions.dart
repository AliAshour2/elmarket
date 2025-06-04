class AppExceptions implements Exception {
  final String message;

  AppExceptions({required this.message});

  @override
  String toString() {
    return 'AppException: $message ';
  }
}

class AuthException extends AppExceptions {
  AuthException({required super.message});
}

class LocalException extends AppExceptions {
  LocalException({required super.message});
}

class RemoteException extends AppExceptions {
  RemoteException({required super.message});
}
