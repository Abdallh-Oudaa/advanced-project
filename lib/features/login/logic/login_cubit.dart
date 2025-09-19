


import 'package:advanced_project/core/networking/api_result.dart';
import 'package:flutter/material.dart';

import '../data/model/login_request.dart';
import '../data/repo/repo_login.dart';
import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<LoginState> {
  final RepoLogin _repoLogin;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final  formKey = GlobalKey<FormState>();
   bool isVisible=true;
  LoginCubit(this._repoLogin) : super(LoginState.initial());
  Future<void> emitLoginState() async {
    emit(LoginState.loading());
    final response = await _repoLogin.repoLogin(LoginRequest(emailController.text,
        passwordController.text));
    response.when(
      success: (data) => emit(LoginState.success(data)),
      failure: (errorHandler) =>
          emit(LoginState.error(errorHandler.apiErrorModel.message ?? "")),
    );
  }
}
