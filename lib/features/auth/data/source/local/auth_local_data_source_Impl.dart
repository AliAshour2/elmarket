import 'package:elmarket/core/constants/app_constants.dart';
import 'package:elmarket/features/auth/data/source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> saveToken(String token) async {
    try {
      await sharedPreferences.setString(CacheTokens.tokenKey, token);
    } catch (e) {
      // Optionally handle or log the error
      throw Exception('Failed to save token: $e');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return sharedPreferences.getString(CacheTokens.tokenKey);
    } catch (e) {
      // Optionally handle or log the error
      throw Exception('Failed to retrieve token: $e');
    }
  }

  @override
  Future<void> removeToken() async {
    try {
      await sharedPreferences.remove(CacheTokens.tokenKey);
    } catch (e) {
      throw Exception('Failed to remove token: $e');
    }
  }
}
