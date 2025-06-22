import 'package:dartz/dartz.dart';
import 'package:elmarket/core/errors/failures.dart';
import 'package:elmarket/features/auth/data/models/sign_in/sign_in_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up/sign_up_model.dart';
import 'package:elmarket/features/auth/domain/entities/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failures, UserModel>> signIn(SignInModel parameters);
  Future<Either<Failures, UserModel>> signUp(SignUpModel parameters);
  Future<String?> getToken();
  // Future<void> signOut();
}
