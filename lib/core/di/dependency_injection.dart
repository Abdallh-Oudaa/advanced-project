import 'package:advanced_project/features/login/logic/login_cubit.dart';
import 'package:advanced_project/features/signUp/data/repo/sign_up_repo.dart';
import 'package:advanced_project/features/signUp/logic/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/data/repo/repo_login.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
// dio&api_service
  Dio? dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio!),
  );
//login
  getIt.registerLazySingleton<RepoLogin>(
    () => RepoLogin(getIt<ApiService>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<RepoLogin>()));
// sign_up
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(getIt<SignUpRepo>()),
  );
}
