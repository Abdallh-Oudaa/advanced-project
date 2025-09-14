
import 'package:advanced_project/features/login/logic/login_cubit.dart';
import 'package:advanced_project/features/login/logic/login_state.dart';

import 'package:advanced_project/features/login/ui/widgts/login_screen_section.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        listener: (context, state) {
          state.whenOrNull(loading: () {
            return const AlertDialog(title: Text("Loading"), content: CircularProgressIndicator());
          }, error: (error) {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  icon: const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 32,
                  ),
                  content: Text(
                    error!,
                    style: TextStyleHelper.font15DarkBlueMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'Got it',
                        style: TextStyleHelper.font14BlueSemiBold,
                      ),
                    ),
                  ],
                );
              },
            );
          }, success: (response) {
            context.pop();
            context.pushNamed(ConstantRoutes.homeScreen);
          });
        },
        child: const LoginScreenSection());
  }
}
