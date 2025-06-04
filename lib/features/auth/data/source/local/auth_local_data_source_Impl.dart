import 'package:elmarket/core/constants/app_constants.dart';
import 'package:elmarket/core/errors/exceptions.dart';
import 'package:elmarket/features/auth/data/source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString(CacheTokens.tokenKey, token);
    } catch (e) {
      throw LocalException(message: 'Failed to save token: ${e.toString()}');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      return sharedPreferences.getString(CacheTokens.tokenKey);
    } catch (e) {
      throw LocalException(message: 'Failed to get token: ${e.toString()}');
    }
  }

  @override
  Future<void> removeToken() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.remove(CacheTokens.tokenKey);
    } catch (e) {
      throw LocalException(message: 'Failed to remove token: ${e.toString()}');
    }
  }
}
