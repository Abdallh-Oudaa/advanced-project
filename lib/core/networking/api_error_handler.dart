import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';




enum DataSource {
 noContent,
  badRequest,
  forBidden,
  unAuthorised,
  notFound,
  internalServerError,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  // API_LOGIC_ERROR,
  deFAULT
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unAuthorised = 401; // failure, user is not authorised
  static const int forBidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  static const int apiLogicError = 422; // API , lOGIC ERROR

  // local status code
  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int onInternetConnection = -6;
  static const int deFAULT = -7;
}

class ResponseMessage {
  static const String noContent =
      ApiErrors.noContent; // success with no data (no content)
  static const String badRequest =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String unAuthorised =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  static const String forBidden =
      ApiErrors.forbiddenError; //  failure, API rejected request
  static const String internalServerError =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String notFound =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static String connectTimeOut = ApiErrors.timeoutError;
  static String cancel = ApiErrors.defaultError;
  static String receiveTimeOut = ApiErrors.timeoutError;
  static String sendTimeOut = ApiErrors.timeoutError;
  static String cacheError = ApiErrors.cacheError;
  static String onInternetConnection = ApiErrors.noInternetError;
  static String deFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.noContent:
        return ApiErrorModel(
            code: ResponseCode.noContent, message: ResponseMessage.noContent);
      case DataSource.badRequest:
        return ApiErrorModel(
            code: ResponseCode.badRequest,
            message: ResponseMessage.badRequest);
      case DataSource.forBidden:
        return ApiErrorModel(
            code: ResponseCode.forBidden, message: ResponseMessage.forBidden);
      case DataSource.unAuthorised:
        return ApiErrorModel(
            code: ResponseCode.unAuthorised,
            message: ResponseMessage.unAuthorised);
      case DataSource.notFound:
        return ApiErrorModel(
            code: ResponseCode.notFound, message: ResponseMessage.notFound);
      case DataSource.internalServerError:
        return ApiErrorModel(
            code: ResponseCode.internalServerError,
            message: ResponseMessage.internalServerError);
      case DataSource.connectTimeOut:
        return ApiErrorModel(
            code: ResponseCode.connectTimeOut,
            message: ResponseMessage.connectTimeOut);
      case DataSource.cancel:
        return ApiErrorModel(
            code: ResponseCode.cancel, message: ResponseMessage.cancel);
      case DataSource.receiveTimeOut:
        return ApiErrorModel(
            code: ResponseCode.receiveTimeOut,
            message: ResponseMessage.receiveTimeOut);
      case DataSource.sendTimeOut:
        return ApiErrorModel(
            code: ResponseCode.sendTimeOut,
            message: ResponseMessage.sendTimeOut);
      case DataSource.noInternetConnection:
        return ApiErrorModel(
            code: ResponseCode.onInternetConnection,
            message: ResponseMessage.onInternetConnection);
      case DataSource.deFAULT:
        return ApiErrorModel(
            code: ResponseCode.deFAULT, message: ResponseMessage.deFAULT);
      case DataSource.cacheError:
        
        throw UnimplementedError();
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.deFAULT.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeOut.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.deFAULT.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.deFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.deFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.deFAULT.getFailure();
    }
}

