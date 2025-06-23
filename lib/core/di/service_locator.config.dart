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
import 'package:elmarket/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:elmarket/features/auth/data/source/local/auth_local_data_source.dart'
    as _i146;
import 'package:elmarket/features/auth/data/source/local/auth_local_data_source_Impl.dart'
    as _i84;
import 'package:elmarket/features/auth/data/source/remote/auth_api_remote_data_source_Impl.dart'
    as _i834;
import 'package:elmarket/features/auth/data/source/remote/auth_api_remote_date_source.dart'
    as _i271;
import 'package:elmarket/features/auth/domain/repository/auth_repository.dart'
    as _i161;
import 'package:elmarket/features/auth/domain/use_case/get_token_use_case.dart'
    as _i956;
import 'package:elmarket/features/auth/domain/use_case/sign_in_use_case.dart'
    as _i570;
import 'package:elmarket/features/auth/domain/use_case/sign_up_use_case.dart'
    as _i354;
import 'package:elmarket/features/auth/presentation/cubit/auth_cubit.dart'
    as _i290;
import 'package:elmarket/features/layout/categories/data/data_source/categories_data_source.dart'
    as _i332;
import 'package:elmarket/features/layout/categories/data/data_source/categories_remore_data_source.dart'
    as _i70;
import 'package:elmarket/features/layout/categories/data/repository_impl/categories_repository_impl.dart'
    as _i529;
import 'package:elmarket/features/layout/categories/domain/repositories/categories_repository.dart'
    as _i1014;
import 'package:elmarket/features/layout/categories/domain/use_case/get_all_categories_use_case.dart'
    as _i252;
import 'package:elmarket/features/layout/categories/presentation/cubit/categories_cubit.dart'
    as _i503;
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
    gh.lazySingleton<_i503.CategoriesCubit>(
        () => _i503.CategoriesCubit(gh<_i252.GetAllCategoriesUseCase>()));
    gh.singleton<_i271.AuthRemoteDateSource>(
        () => _i834.AuthApiRemoteDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i332.CategoriesDataSource>(
        () => _i70.CategoriesRemoreDaraSource(dio: gh<_i361.Dio>()));
    gh.singleton<_i146.AuthLocalDataSource>(() => _i84.AuthLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i1014.CategoriesRepository>(() =>
        _i529.CategoriesRepositoryImpl(
            categoriesDataSource: gh<_i332.CategoriesDataSource>()));
    gh.singleton<_i161.AuthRepository>(() => AuthRepositoryImpl(
          authApiRemoteDataSource: gh<_i271.AuthRemoteDateSource>(),
          authLocalDataSource: gh<_i146.AuthLocalDataSource>(),
        ));
    gh.singleton<_i570.SignInUseCase>(
        () => _i570.SignInUseCase(authRepository: gh<_i161.AuthRepository>()));
    gh.singleton<_i354.SignUpUseCase>(
        () => _i354.SignUpUseCase(authRepository: gh<_i161.AuthRepository>()));
    gh.singleton<_i956.GetTokenUseCase>(() =>
        _i956.GetTokenUseCase(authRepository: gh<_i161.AuthRepository>()));
    gh.singleton<_i290.AuthCubit>(() => _i290.AuthCubit(
          gh<_i570.SignInUseCase>(),
          gh<_i354.SignUpUseCase>(),
          gh<_i956.GetTokenUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i470.RegisterModule {}
