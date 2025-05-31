import 'package:elmarket/features/auth/data/models/sign_in_model.dart';
import 'package:elmarket/features/auth/data/models/sign_in_reponse/sign_in_reponse_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up_reponse/sign_up_response_model.dart';
import 'package:elmarket/features/auth/data/source/remote/auth_api_remote_date_source.dart';

class AuthApiRemoteDataSourceEmpl extends AuthApiRemoteDateSource {
  @override
  Future<SignInResponseModel> signIn(SignInModel signInModelParameters) {
    throw UnimplementedError();
  }

  @override
  Future<SignUpResponseModel> signUp(SignUpModel signUpModelParameters) {
    throw UnimplementedError();
  }
}
