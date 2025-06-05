import 'package:elmarket/core/constants/app_constants.dart';
import 'package:elmarket/core/errors/exceptions.dart';
import 'package:elmarket/features/auth/data/source/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> saveToken(String token) async {
    try {
      await sharedPreferences.setString(CacheTokens.tokenKey, token);
    } catch (e) {
      throw LocalException(message: 'Failed to save token: ${e.toString()}');
    }
  }

  @override
  String? getToken() {
    try {
      return sharedPreferences.getString(CacheTokens.tokenKey);
    } catch (e) {
      throw LocalException(message: 'Failed to get token: ${e.toString()}');
    }
  }

  @override
  Future<void> removeToken() async {
    try {
      await sharedPreferences.remove(CacheTokens.tokenKey);
    } catch (e) {
      throw LocalException(message: 'Failed to remove token: ${e.toString()}');
    }
  }
}
