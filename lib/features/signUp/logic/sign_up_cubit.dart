import 'package:advanced_project/core/networking/api_result.dart';
import 'package:advanced_project/features/signUp/data/model/sign_up_request.dart';
import 'package:advanced_project/features/signUp/data/repository/sign_up_repo_contract.dart';
import 'package:advanced_project/features/signUp/logic/sign_up_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpRepoContract signUpRepoContract;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  var formKey=GlobalKey<FormState>();

  TextEditingController confirmPasswordController = TextEditingController();

  SignUpCubit(this.signUpRepoContract) : super(const SignUpState.initial());
  emitSignUp() async {
    emit(const SignUpState.loading());
    var response = await signUpRepoContract.signUp(SignUpRequest(
        phoneController.text,
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,0));
    response.when(
      success: (data) => emit(SignUpState.success(data)),
      error: (error) => emit(SignUpState.error(error.apiErrorModel.message)),
    );
  }
}
