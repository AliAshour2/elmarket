import 'package:dio/dio.dart';
import 'package:elmarket/core/constants/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  // url here will be injected
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  // same thing works for instances that's gotten asynchronous.
  // all you need to do is wrap your instance with a future and tell injectable how
  // to initialize it
  @preResolve // if you need to pre resolve the value
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  // Also, make sure you await for your configure function before running the App.
}
