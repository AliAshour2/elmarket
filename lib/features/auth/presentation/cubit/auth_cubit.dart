import 'package:elmarket/features/auth/data/models/sign_in/sign_in_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up/sign_up_model.dart';
import 'package:elmarket/features/auth/data/repository/auth_repository.dart';
import 'package:elmarket/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  AuthRepository authRepository;

  signIn(SignInModel parameters) async {
    emit(AuthSignInLoading());
    var response = await authRepository.signIn(parameters);
    response.fold((failure) => emit(AuthSignInError(message: failure.message)),
        (user) => emit(AuthSignInSuccess()));
  }

  signUp(SignUpModel parameters) async {
    emit(AuthSignUpLoading());
    var response = await authRepository.signUp(parameters);
    response.fold((failure) => emit(AuthSignInError(message: failure.message)),
        (user) => emit(AuthSignUpSuccess()));
  }
}
