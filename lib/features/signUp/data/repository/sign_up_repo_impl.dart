import 'package:advanced_project/core/networking/api_error_handling.dart';
import 'package:advanced_project/core/networking/api_result.dart';
import 'package:advanced_project/core/networking/api_service.dart';
import 'package:advanced_project/features/signUp/data/model/sign_up_request.dart';
import 'package:advanced_project/features/signUp/data/model/sign_up_response.dart';
import 'package:advanced_project/features/signUp/data/repository/sign_up_repo_contract.dart';
import 'package:advanced_project/features/signUp/logic/sign_up_state.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:  SignUpRepoContract)
class SignUpRepoImpl extends SignUpRepoContract{
  final ApiService _apiService;
  SignUpRepoImpl(this._apiService);
  @override
  Future<ApiResult<SignUpResponse>> signUp(SignUpRequest signUpRequest)async{

try{
  var response=await _apiService.signUp(signUpRequest);
  return ApiResult.success(response);
}catch(e){
  return ApiResult.error(ErrorHandler.handle(e));
}
  }

}