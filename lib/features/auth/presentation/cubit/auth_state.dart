abstract class AuthState {}

// Initail State
class AuthInitial extends AuthState {
  AuthInitial();
}

//  Sign In States
class AuthSignInLoading extends AuthState {}

class AuthSignInSuccess extends AuthState {
  // final String token;
}

class AuthSignInError extends AuthState {}

// Sign Out States
class AuthSignOutLoading extends AuthState {}

class AuthSignOutSuccess extends AuthState {}

class AuthSignOutFailure extends AuthState {}

// Sign Up States
class AuthSignUpLoading extends AuthState {}

class AuthSignUpSuccess extends AuthState {}

class AuthSignUpError extends AuthState {}
