

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../model/login_request.dart';
import '../model/login_response.dart';

class RepoLogin{
 final ApiService _apiService;
  RepoLogin(this._apiService);
  Future<ApiResult<LoginResponse>> repoLogin(LoginRequest loginRequest)async{
    try{
      final response= await _apiService.login(loginRequest);
      return ApiResult.success(response);
  } catch (error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
}}