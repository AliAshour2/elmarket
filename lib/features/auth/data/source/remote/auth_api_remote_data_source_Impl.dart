import 'package:dio/dio.dart';
import 'package:elmarket/core/constants/api_constants.dart';
import 'package:elmarket/core/errors/exceptions.dart';
import 'package:elmarket/features/auth/data/models/sign_in/sign_in_model.dart';
import 'package:elmarket/features/auth/data/models/sign_in/sign_in_reponse_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up/sign_up_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up/sign_up_response_model.dart';
import 'package:elmarket/features/auth/data/source/remote/auth_api_remote_date_source.dart';

class AuthApiRemoteDataSourceImpl extends AuthApiRemoteDateSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  @override
  Future<SignInResponseModel> signIn(SignInModel signInModelParameters) async {
    try {
      var response = await dio.post(ApiConstants.signInEndPoint,
          data: signInModelParameters.toJson());
      return SignInResponseModel.fromJson(response.data);
    } catch (e) {
      String message = '';
      if (e is DioException) {
        message = e.response?.data is Map
            ? e.response!.data['message']
            : "Unknown error occurred";
        throw AuthException(message: message);
      }
      throw RemoteException(message: message);
    }
  }

  @override
  Future<SignUpResponseModel> signUp(SignUpModel signUpModelParameters) async {
    try {
      var response = await dio.post(ApiConstants.signUpEndPoint,
          data: signUpModelParameters.toJson());
      return SignUpResponseModel.fromJson(response.data);
    } catch (e) {
      String message = '';
      if (e is DioException) {
        message = e.response?.data is Map
            ? e.response!.data['message']
            : "Unknown error occurred";
        throw AuthException(message: message);
      }
      throw RemoteException(message: message);
    }
  }
}
