import 'package:elmarket/features/auth/data/models/sign_in/sign_in_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up/sign_up_model.dart';
import 'package:elmarket/features/auth/data/repository/auth_repository.dart';
import 'package:elmarket/features/auth/data/source/local/auth_local_data_source_Impl.dart';
import 'package:elmarket/features/auth/data/source/remote/auth_api_remote_data_source_Impl.dart';
import 'package:elmarket/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository authRepository = AuthRepository(
      authApiRemoteDataSource: AuthApiRemoteDataSourceImpl(),
      authLocalDataSource: AuthLocalDataSourceImpl());

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
