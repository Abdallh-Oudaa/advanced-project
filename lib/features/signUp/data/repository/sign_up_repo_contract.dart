import 'package:advanced_project/core/networking/api_result.dart';
import 'package:advanced_project/features/signUp/data/model/sign_up_request.dart';
import 'package:advanced_project/features/signUp/data/model/sign_up_response.dart';

abstract class SignUpRepoContract{
  Future<ApiResult<SignUpResponse>> signUp(SignUpRequest signUpRequest);
}