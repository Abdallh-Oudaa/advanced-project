import 'package:advanced_project/core/helper/extension.dart';
import 'package:advanced_project/core/routing/constant_routes.dart';
import 'package:advanced_project/features/login/logic/login_cubit.dart';
import 'package:advanced_project/features/login/logic/login_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/text_style.dart';

class BlocListenerWidget extends StatelessWidget {
  const BlocListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          success: (data) {
            context.pop();
            context.pushReplacementNamed(ConstantRoutes.homeScreen);
          },
          error: (message) => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                content: Text(
                  message,
                  style: TextStyleHelper.font15DarkGrayMedium.copyWith(color: Colors.black),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        "Got it",
                        style: TextStyleHelper.font14DarkGrayRegular.copyWith(color: Colors.black),
                      ))
                ],
              );
            },
          ),

        );
      },
      child: SizedBox.shrink(),
    );
  }
}
