import 'package:advanced_project/core/networking/api_constants.dart';
import 'package:advanced_project/core/networking/api_error_model.dart';
import 'package:dio/dio.dart';

/// Handles Dio errors
class ErrorHandler implements Exception {
  late final ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleDioError(error);
    } else {
      apiErrorModel = DataSource.unknown.failure;
    }
  }
}

ApiErrorModel _handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.failure;
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.failure;
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.failure;
    case DioExceptionType.cancel:
      return DataSource.cancel.failure;
    case DioExceptionType.badResponse:
    case DioExceptionType.unknown:
      return error.response?.data != null
          ? ApiErrorModel.fromJson(error.response!.data)
          : DataSource.unknown.failure;
    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
      return DataSource.unknown.failure;
  }
}

/// Represents all possible error sources
enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  unknown,
}

/// Response codes
class ResponseCode {
  static const int noContent = 204;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unauthorized = 401;
  static const int notFound = 404;
  static const int internalServerError = 500;

  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int unknown = -7;
}

extension DataSourceX on DataSource {
  ApiErrorModel get failure {
    switch (this) {
      case DataSource.noContent:
        return ApiErrorModel(code: ResponseCode.noContent, message: ResponseMessage.noContent);
      case DataSource.badRequest:
        return ApiErrorModel(code: ResponseCode.badRequest, message: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return ApiErrorModel(code: ResponseCode.forbidden, message: ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return ApiErrorModel(
            code: ResponseCode.unauthorized, message: ResponseMessage.unauthorized);
      case DataSource.notFound:
        return ApiErrorModel(code: ResponseCode.notFound, message: ResponseMessage.notFound);
      case DataSource.internalServerError:
        return ApiErrorModel(
            code: ResponseCode.internalServerError, message: ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return ApiErrorModel(
            code: ResponseCode.connectTimeout, message: ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return ApiErrorModel(code: ResponseCode.cancel, message: ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return ApiErrorModel(
            code: ResponseCode.receiveTimeout, message: ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return ApiErrorModel(code: ResponseCode.sendTimeout, message: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return ApiErrorModel(code: ResponseCode.cacheError, message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return ApiErrorModel(
            code: ResponseCode.noInternetConnection, message: ResponseMessage.noInternetConnection);
      case DataSource.unknown:
        return ApiErrorModel(code: ResponseCode.unknown, message: ResponseMessage.unknown);
    }
  }
}
