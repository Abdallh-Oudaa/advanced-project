import 'package:advanced_project/core/networking/api_result.dart';
import 'package:advanced_project/features/signUp/data/model/sign_up_request.dart';
import 'package:advanced_project/features/signUp/data/repo/sign_up_repo.dart';
import 'package:advanced_project/features/signUp/logic/sign_up_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final SignUpRepo _signUpRepo;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isVisible = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();
  SignUpCubit(this._signUpRepo) : super(SignUpStates.initial());
  Future<void> emitSignUp() async {
    final response = await _signUpRepo.signUPRepo(SignUpRequest(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmController.text,
        gender: 0));

    response.when(
      success: (data) => emit(SignUpStates.success(data)),
      failure: (errorHandler) =>
          emit(SignUpStates.error(errorHandler.apiErrorModel.message ?? "")),
    );
  }
}
