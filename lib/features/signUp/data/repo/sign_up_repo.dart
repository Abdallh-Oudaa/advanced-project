import 'package:advanced_project/core/networking/api_error_handler.dart';
import 'package:advanced_project/core/networking/api_result.dart';
import 'package:advanced_project/core/networking/api_service.dart';
import 'package:advanced_project/features/signUp/data/model/sign_up_request.dart';

class SignUpRepo {
  final ApiService apiService;
  SignUpRepo(this.apiService);
  Future<ApiResult> signUPRepo(SignUpRequest signUpRequest) async {
    try {
      final response = await apiService.signUp(signUpRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
