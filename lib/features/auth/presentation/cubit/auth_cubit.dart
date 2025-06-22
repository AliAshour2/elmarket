import 'package:elmarket/features/auth/data/models/sign_in/sign_in_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up/sign_up_model.dart';
import 'package:elmarket/features/auth/domain/use_case/get_token_use_case.dart';
import 'package:elmarket/features/auth/domain/use_case/sign_in_use_case.dart';
import 'package:elmarket/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:elmarket/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._signInUseCase, this._signUpUseCase, this._getTokenUseCase)
      : super(AuthInitial()) {
    getToken();
  }

  SignUpUseCase _signUpUseCase;
  SignInUseCase _signInUseCase;
  GetTokenUseCase _getTokenUseCase;
  String? token;

  signIn(SignInModel parameters) async {
    emit(AuthSignInLoading());
    var response = await _signInUseCase(parameters);
    response.fold((failure) => emit(AuthSignInError(message: failure.message)),
        (user) => emit(AuthSignInSuccess()));
  }

  signUp(SignUpModel parameters) async {
    emit(AuthSignUpLoading());
    var response = await _signUpUseCase(parameters);
    response.fold((failure) => emit(AuthSignInError(message: failure.message)),
        (user) => emit(AuthSignUpSuccess()));
  }

  Future<void> getToken() async {
    String? _token = await _getTokenUseCase();
    if (token != null) {
      emit(AuthGetTokenSuccess());
      token = _token;
    } else {
      emit(AuthGetTokenError());
    }
  }
}
