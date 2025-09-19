import 'package:advanced_project/features/signUp/data/model/sign_up_request.dart';
import 'package:advanced_project/features/signUp/data/model/sign_up_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/login/data/model/login_request.dart';
import '../../features/login/data/model/login_response.dart';
import 'api_constants.dart';
part 'api_service.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
  @POST(ApiConstants.signup)
  Future<SignUpResponse> signUp(@Body() SignUpRequest signUpRequest);
}
