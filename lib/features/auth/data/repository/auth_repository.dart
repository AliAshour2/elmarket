import 'package:elmarket/features/auth/data/models/sign_in/sign_in_model.dart';
import 'package:elmarket/features/auth/data/models/sign_up/sign_up_model.dart';
import 'package:elmarket/features/auth/data/models/user_model.dart';
import 'package:elmarket/features/auth/data/source/local/auth_local_data_source.dart';
import 'package:elmarket/features/auth/data/source/remote/auth_api_remote_date_source.dart';

class AuthRepository {
  AuthApiRemoteDateSource authApiRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  AuthRepository({
    required this.authApiRemoteDataSource,
    required this.authLocalDataSource,
  });

  Future<UserModel> signIn(SignInModel parameters)async {
   var reponse = await authApiRemoteDataSource.signIn(parameters);
   authLocalDataSource.saveToken(reponse.token);
   return  reponse.user;
  }

  signUp(SignUpModel parameters)async {
    var response = await authApiRemoteDataSource.signUp(parameters);
    authLocalDataSource.saveToken(response.token);  
    return response.user;
  }
}
