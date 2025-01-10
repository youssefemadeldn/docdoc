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

import '../../features/home/data/data_sources/remote/base_home_remote_data_source.dart'
    as _i792;
import '../../features/home/data/data_sources/remote/home_remote_data_source_impl.dart'
    as _i985;
import '../../features/home/data/repo/home_repo_impl.dart' as _i1024;
import '../../features/home/domain/repo/base_home_repo.dart' as _i172;
import '../../features/home/domain/use_cases/home_use_case.dart' as _i933;
import '../../features/home/presentation/controller/home_cubit/home_cubit.dart'
    as _i498;
import '../../features/login/data/data_sources/remote/base_remote_login_data_source.dart'
    as _i444;
import '../../features/login/data/data_sources/remote/remote_login_data_source_impl.dart'
    as _i259;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
import '../../features/login/domain/repo/base_login_repo.dart' as _i375;
import '../../features/login/domain/use_cases/login_use_case.dart' as _i191;
import '../../features/login/presentation/controller/cubit/login_cubit.dart'
    as _i982;
import '../../features/sign_up/data/data_sources/remote/base_remote_sign_up_data_source.dart'
    as _i200;
import '../../features/sign_up/data/data_sources/remote/remote_sign_up_data_source_impl.dart'
    as _i117;
import '../../features/sign_up/data/repo/sign_up_repo_impl.dart' as _i138;
import '../../features/sign_up/domain/repo/base_sign_up_repo.dart' as _i594;
import '../../features/sign_up/domain/use_cases/sing_up_use_case.dart' as _i273;
import '../../features/sign_up/presentation/controller/sign_up_cubit/sign_up_cubit.dart'
    as _i484;
import '../network/dio_module.dart' as _i614;
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
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i876.RestClient>(
        () => dioModule.provideRestClient(gh<_i361.Dio>()));
    gh.factory<_i200.BaseRemoteSignUpDataSource>(() =>
        _i117.RemoteSignUpDataSourceImpl(restClient: gh<_i876.RestClient>()));
    gh.factory<_i594.BaseSignUpRepo>(() => _i138.SignUpRepoImpl(
        baseRemoteSignUpDataSource: gh<_i200.BaseRemoteSignUpDataSource>()));
    gh.factory<_i792.BaseHomeRemoteDataSource>(() =>
        _i985.HomeRemoteDataSourceImpl(restClient: gh<_i876.RestClient>()));
    gh.factory<_i444.BaseRemoteLoginDataSource>(() =>
        _i259.RemoteLoginDataSourceImpl(apiService: gh<_i876.RestClient>()));
    gh.factory<_i273.SingUpUseCase>(
        () => _i273.SingUpUseCase(baseSingUpRepo: gh<_i594.BaseSignUpRepo>()));
    gh.factory<_i172.BaseHomeRepo>(() => _i1024.HomeRepoImpl(
        baseHomeDataSource: gh<_i792.BaseHomeRemoteDataSource>()));
    gh.factory<_i375.BaseLoginRepo>(() => _i176.LoginRepoImpl(
        baseRemoteLoginDataSource: gh<_i444.BaseRemoteLoginDataSource>()));
    gh.factory<_i933.HomeUseCase>(
        () => _i933.HomeUseCase(baseHomeRepo: gh<_i172.BaseHomeRepo>()));
    gh.factory<_i498.HomeCubit>(
        () => _i498.HomeCubit(homeUseCase: gh<_i933.HomeUseCase>()));
    gh.factory<_i484.SignUpCubit>(
        () => _i484.SignUpCubit(singUpUseCases: gh<_i273.SingUpUseCase>()));
    gh.factory<_i191.LoginUseCase>(
        () => _i191.LoginUseCase(baseLoginRepo: gh<_i375.BaseLoginRepo>()));
    gh.factory<_i982.LoginCubit>(
        () => _i982.LoginCubit(loginUseCase: gh<_i191.LoginUseCase>()));
    return this;
  }
}

class _$DioModule extends _i614.DioModule {}
