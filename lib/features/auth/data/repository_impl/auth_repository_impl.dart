import 'package:dartz/dartz.dart';
import 'package:elmarket/core/errors/exceptions.dart';
import 'package:elmarket/core/errors/failures.dart';
import 'package:elmarket/features/auth/data/mapper/user_mapper.dart';
import 'package:elmarket/features/auth/data/models/sign_in/sign_in_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up/sign_up_model.dart';
import 'package:elmarket/features/auth/data/source/local/auth_local_data_source.dart';
import 'package:elmarket/features/auth/data/source/remote/auth_api_remote_date_source.dart';
import 'package:elmarket/features/auth/domain/entities/user_model.dart';
import 'package:elmarket/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDateSource authApiRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl({
    required this.authApiRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failures, UserModel>> signIn(SignInModel parameters) async {
    try {
      var reponse = await authApiRemoteDataSource.signIn(parameters);
      authLocalDataSource.saveToken(reponse.token);
      return Right(reponse.user.userResponseToUserModel());
    } on AppExceptions catch (e) {
      Failures failure = Failures(message: e.message);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failures, UserModel>> signUp(SignUpModel parameters) async {
    try {
      var response = await authApiRemoteDataSource.signUp(parameters);
      authLocalDataSource.saveToken(response.token);
      return Right(response.user.userResponseToUserModel());
    } on AppExceptions catch (e) {
      Failures failure = Failures(message: e.message);
      return Left(failure);
    }
  }

  @override
  Future<String?> getToken() async {
    return authLocalDataSource.getToken();
  }
}
