import 'package:advanced_project/core/networking/api_result.dart';
import 'package:advanced_project/features/login/data/model/login_request.dart';
import 'package:advanced_project/features/login/data/model/login_response.dart';


abstract class LoginRepoContract{
  Future<ApiResult<LoginResponse>> login(LoginRequest loginRequest);
}