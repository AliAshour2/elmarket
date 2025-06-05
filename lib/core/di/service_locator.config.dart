// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:elmarket/core/di/register_models.dart' as _i470;
import 'package:elmarket/features/auth/data/repository/auth_repository.dart'
    as _i784;
import 'package:elmarket/features/auth/data/source/local/auth_local_data_source.dart'
    as _i146;
import 'package:elmarket/features/auth/data/source/local/auth_local_data_source_Impl.dart'
    as _i84;
import 'package:elmarket/features/auth/data/source/remote/auth_api_remote_data_source_Impl.dart'
    as _i834;
import 'package:elmarket/features/auth/data/source/remote/auth_api_remote_date_source.dart'
    as _i271;
import 'package:elmarket/features/auth/presentation/cubit/auth_cubit.dart'
    as _i290;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i271.AuthRemoteDateSource>(
        () => _i834.AuthApiRemoteDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.singleton<_i146.AuthLocalDataSource>(() => _i84.AuthLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.singleton<_i784.AuthRepository>(() => _i784.AuthRepository(
          authApiRemoteDataSource: gh<_i271.AuthRemoteDateSource>(),
          authLocalDataSource: gh<_i146.AuthLocalDataSource>(),
        ));
    gh.singleton<_i290.AuthCubit>(
        () => _i290.AuthCubit(gh<_i784.AuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i470.RegisterModule {}
