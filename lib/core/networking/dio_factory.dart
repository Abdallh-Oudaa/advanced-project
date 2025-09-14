import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@module
abstract class DioFactory {
@lazySingleton
  Dio get dio => Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {"Accept": "application/json"}))
    ..interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
       responseBody: true,
      error: true,
    ));

}
