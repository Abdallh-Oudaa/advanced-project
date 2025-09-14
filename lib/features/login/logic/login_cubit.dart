import 'package:advanced_project/core/networking/api_result.dart';
import 'package:advanced_project/features/login/data/model/login_request.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/repository/login_repo_contract.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginRepoContract loginRepoContract;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginCubit(this.loginRepoContract) : super(const LoginState.initial());
  void emitLogin() async {
    emit(const LoginState.loading());
    final response =
        await loginRepoContract.login(LoginRequest(emailController.text, passwordController.text));
    response.when(
      success: (data) => emit(LoginState.success(data)),
      error: (errorHandler) => emit(LoginState.error(errorHandler.apiErrorModel.message)),
    );
  }
}
