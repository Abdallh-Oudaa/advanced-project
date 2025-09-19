import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static  Dio? _dio;
  DioFactory._();
  static Dio? getDio() {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10)));
      dioInterceptor();
      return _dio;
    }
    return _dio;
  }

  static void dioInterceptor() {
    _dio?.interceptors.add(PrettyDioLogger(
      responseHeader: true,
      requestBody: true,
      requestHeader: true,
      error: true,
    ));
  }
}
