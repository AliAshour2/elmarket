import 'package:dartz/dartz.dart';
import 'package:elmarket/core/errors/failures.dart';
import 'package:elmarket/features/auth/domain/entities/user_model.dart';
import 'package:elmarket/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class SignUpUseCase {
  AuthRepository authRepository;
  SignUpUseCase({
    required this.authRepository,
  });
  Future<Either<Failures, UserModel>> call(signUpParamerters) =>
      authRepository.signUp(signUpParamerters);
}
