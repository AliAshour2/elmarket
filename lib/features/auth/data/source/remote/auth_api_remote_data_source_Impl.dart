import 'package:dio/dio.dart';
import 'package:elmarket/core/constants/api_constants.dart';
import 'package:elmarket/features/auth/data/models/sign_in/sign_in_model.dart';
import 'package:elmarket/features/auth/data/models/sign_in/sign_in_reponse_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up/sign_up_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up/sign_up_response_model.dart';
import 'package:elmarket/features/auth/data/source/remote/auth_api_remote_date_source.dart';

class AuthApiRemoteDataSourceImpl extends AuthApiRemoteDateSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  @override
  Future<SignInResponseModel> signIn(SignInModel signInModelParameters) async {
    var response = await dio.post(ApiConstants.signInEndPoint,
        data: signInModelParameters.toJson());
    return SignInResponseModel.fromJson(response.data);
  }

  @override
  Future<SignUpResponseModel> signUp(SignUpModel signUpModelParameters) {
    var response = dio.post(ApiConstants.signUpEndPoint,
        data: signUpModelParameters.toJson());
    return response.then((value) => SignUpResponseModel.fromJson(value.data));
  }
}
