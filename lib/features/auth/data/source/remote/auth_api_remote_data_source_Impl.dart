import 'package:dio/dio.dart';
import 'package:elmarket/core/constants/api_constants.dart';
import 'package:elmarket/features/auth/data/models/sign_in_model.dart';
import 'package:elmarket/features/auth/data/models/sign_in_reponse/sign_in_reponse_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up_reponse/sign_up_response_model.dart';
import 'package:elmarket/features/auth/data/source/remote/auth_api_remote_date_source.dart';


class AuthApiRemoteDataSourceImpl extends AuthApiRemoteDateSource {
  final Dio dio;

  AuthApiRemoteDataSourceImpl(this.dio);

  @override
  Future<SignInResponseModel> signIn(SignInModel signInModelParameters) async {
    try {
      final response = await dio.post(
        ApiConstants.signInEndPoint,
        data: signInModelParameters.toJson(),
      );
      return SignInResponseModel.fromJson(response.data);
    } catch (e) {
      // Optionally log the error
      throw Exception('Sign in failed: $e');
    }
  }

  @override
  Future<SignUpResponseModel> signUp(SignUpModel signUpModelParameters) async {
    try {
      final response = await dio.post(
        ApiConstants.signUpEndPoint,
        data: signUpModelParameters.toJson(),
      );
      return SignUpResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }
}
