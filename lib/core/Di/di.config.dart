// dart format width=80
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

import '../../features/login/data/repository/login_repo_contract.dart'
    as _i1052;
import '../../features/login/data/repository/login_repo_impl.dart' as _i123;
import '../../features/login/logic/login_cubit.dart' as _i88;
import '../../features/signUp/data/repository/sign_up_repo_contract.dart'
    as _i856;
import '../../features/signUp/data/repository/sign_up_repo_impl.dart' as _i916;
import '../../features/signUp/logic/sign_up_cubit.dart' as _i193;
import '../networking/api_service.dart' as _i700;
import '../networking/dio_factory.dart' as _i103;

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
    final dioFactory = _$DioFactory();
    gh.lazySingleton<_i361.Dio>(() => dioFactory.dio);
    gh.lazySingleton<_i700.ApiService>(() => _i700.ApiService(gh<_i361.Dio>()));
    gh.factory<_i856.SignUpRepoContract>(
        () => _i916.SignUpRepoImpl(gh<_i700.ApiService>()));
    gh.factory<_i1052.LoginRepoContract>(
        () => _i123.LoginRepoImpl(gh<_i700.ApiService>()));
    gh.factory<_i88.LoginCubit>(
        () => _i88.LoginCubit(gh<_i1052.LoginRepoContract>()));
    gh.factory<_i193.SignUpCubit>(
        () => _i193.SignUpCubit(gh<_i856.SignUpRepoContract>()));
    return this;
  }
}

class _$DioFactory extends _i103.DioFactory {}
