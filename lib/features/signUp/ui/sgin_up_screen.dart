import 'package:advanced_project/core/helper/extension.dart';
import 'package:advanced_project/core/helper/text_style.dart';


import 'package:advanced_project/features/signUp/logic/sign_up_cubit.dart';
import 'package:advanced_project/features/signUp/logic/sign_up_state.dart';
import 'package:advanced_project/features/signUp/ui/local_widgets/sign_up_section.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routing/constant_routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
        listenWhen: (previous, current) =>
        current is Loading || current is Success || current is Error,
        listener: (context, state) {
          state.whenOrNull(loading: () {
            return const AlertDialog(

                title: Text("Loading"),
                content:CircularProgressIndicator()

            );
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
            context.pushNamed(ConstantRoutes.loginScreen);
          });
        },
        child: const SignUpSection());
  }
}
