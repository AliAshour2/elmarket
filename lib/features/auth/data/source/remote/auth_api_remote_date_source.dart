import 'package:elmarket/features/auth/data/models/sign_in_model.dart';
import 'package:elmarket/features/auth/data/models/sign_in_reponse/sign_in_reponse_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up_reponse/sign_up_response_model.dart';

abstract class AuthApiRemoteDateSource {
  Future<SignInResponseModel> signIn(SignInModel signInModelParameters) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  Future<SignUpResponseModel> signUp(SignUpModel signUpModelParameters) {
    // TODO: implement sugnUp
    throw UnimplementedError();
  }
}
