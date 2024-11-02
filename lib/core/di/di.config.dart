// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/login/data/data_sources/remote/base_remote_login_data_source.dart'
    as _i444;
import '../../features/login/data/data_sources/remote/remote_login_data_source_impl.dart'
    as _i259;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
import '../../features/login/domain/repo/base_login_repo.dart' as _i375;
import '../../features/login/domain/use_cases/login_use_case.dart' as _i191;
import '../../features/login/presentation/controller/cubit/login_cubit.dart'
    as _i982;
import '../network/dio_factory.dart' as _i798;
import '../network/rest_client.dart' as _i876;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.lazySingleton<_i876.RestClient>(
        () => networkModule.provideApiService(gh<_i361.Dio>()));
    gh.factory<_i444.BaseRemoteLoginDataSource>(() =>
        _i259.RemoteLoginDataSourceImpl(apiService: gh<_i876.RestClient>()));
    gh.factory<_i375.BaseLoginRepo>(() => _i176.LoginRepoImpl(
        baseRemoteLoginDataSource: gh<_i444.BaseRemoteLoginDataSource>()));
    gh.factory<_i191.LoginUseCase>(
        () => _i191.LoginUseCase(baseLoginRepo: gh<_i375.BaseLoginRepo>()));
    gh.factory<_i982.LoginCubit>(
        () => _i982.LoginCubit(loginUseCase: gh<_i191.LoginUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i798.NetworkModule {}
