import 'package:elmarket/core/constants/app_constants.dart';
import 'package:elmarket/features/auth/data/source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(CacheTokens.tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(CacheTokens.tokenKey);
  }

  @override
  Future<void> removeToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(CacheTokens.tokenKey);
  }
}
