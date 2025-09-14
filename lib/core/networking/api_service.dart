
import 'package:advanced_project/features/login/data/model/login_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/login/data/model/login_request.dart';
import '../../features/signUp/data/model/sign_up_request.dart';
import 'api_constants.dart';
part 'api_service.g.dart';
@lazySingleton
@RestApi(baseUrl:ApiConstants.apiBaseUrl)
abstract class ApiService{
  @factoryMethod
factory ApiService(Dio dio)=_ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

@POST(ApiConstants.signUp)
  Future<dynamic> signUp(@Body() SignUpRequest signUpRequest);

}