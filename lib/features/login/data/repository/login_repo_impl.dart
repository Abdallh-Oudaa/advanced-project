import 'package:advanced_project/core/networking/api_error_handling.dart';
import 'package:advanced_project/core/networking/api_result.dart';
import 'package:advanced_project/core/networking/api_service.dart';
import 'package:advanced_project/features/login/data/model/login_request.dart';
import 'package:advanced_project/features/login/data/model/login_response.dart';

import 'package:injectable/injectable.dart';

import 'login_repo_contract.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl extends LoginRepoContract {
  final ApiService apiService;
  LoginRepoImpl(this.apiService);
  @override
  Future<ApiResult<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      var response = await apiService.login(loginRequest);
      return ApiResult.success(response);
    } catch (error) {
      //lkjkljkljljlk
      return ApiResult.error(ErrorHandler.handle(error));
    }
  }
}
