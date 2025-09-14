import 'package:advanced_project/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';
@lazySingleton
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;
@GET(ApiConstants.login)
Future<void> loginEndPoint ();
}
