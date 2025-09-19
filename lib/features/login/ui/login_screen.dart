import 'package:advanced_project/features/login/logic/login_cubit.dart';
import 'package:advanced_project/features/login/ui/widgts/bloc_listener_widget.dart';
import 'package:advanced_project/features/login/ui/widgts/rich_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/text_style.dart';
import '../../../core/widgets/buttom_core.dart';
import '../../../core/widgets/email_regex.dart';
import '../../../core/widgets/text_form_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: context.read<LoginCubit>().formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create Account",
                    style: TextStyleHelper.font24blueBold,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                    style: TextStyleHelper.font15GrayRegular,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormCore(
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    textEditingController: context.read<LoginCubit>().emailController,
                    validation: (text) {
                      if (text!.trim().isEmpty) {
                        return "field is empty";
                      }
                      if (validateEmail(text) != null) {
                        return "syntax error";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormCore(
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            context.read<LoginCubit>().isVisible = !context.read<LoginCubit>().isVisible;
                          });
                        },
                        child: Icon(   context.read<LoginCubit>().isVisible
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Password",
                    textEditingController:    context.read<LoginCubit>().passwordController,
                    validation: (text) {
                      if (text!.trim().isEmpty) {
                        return "field is empty";
                      }
                      if (text.length < 6) {
                        return "password too short";
                      }

                      return null;
                    },
                    isObscure:    context.read<LoginCubit>().isVisible,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BottomCore(iconText: "login", onPressedFunc: () {
                    isValid(context);
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  const RichTextWidget(),
                  BlocListenerWidget(),
                ],
              ),
            )),
      ),
    );
  }

  void isValid(BuildContext context) {
    if(context.read<LoginCubit>().formKey.currentState?.validate()!=false){
      context.read<LoginCubit>().emitLoginState();
    }
  }
}
