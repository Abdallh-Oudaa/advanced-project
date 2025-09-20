
import 'package:advanced_project/core/widgets/buttom_core.dart';
import 'package:advanced_project/core/widgets/email_regex.dart';
import 'package:advanced_project/core/widgets/text_form_core.dart';
import 'package:advanced_project/features/login/ui/widgts/bloc_listener_widget.dart';
import 'package:advanced_project/features/login/ui/widgts/rich_text_widget.dart';
import 'package:advanced_project/features/signUp/data/ui/bloc_listen_widget.dart';
import 'package:advanced_project/features/signUp/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: context.read<SignUpCubit>().formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormCore(
                    keyboardType: TextInputType.name,
                    hintText: "name",
                    textEditingController: context.read<SignUpCubit>().nameController,
                    validation: (text) {
                      if (text!.trim().isEmpty) {
                        return "field is empty";
                      }


                      return null;
                    },
                  ),
                  TextFormCore(
                    keyboardType: TextInputType.number,
                    hintText: "phone number",
                    textEditingController: context.read<SignUpCubit>().phoneController,
                    validation: (text) {
                      if (text!.trim().isEmpty) {
                        return "field is empty";
                      }
                      if (text.length<11) {
                        return "must be 11 number";
                      }

                      return null;
                    },
                  ),
                  TextFormCore(
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    textEditingController: context.read<SignUpCubit>().emailController,
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
                            context.read<SignUpCubit>().isVisible = !context.read<SignUpCubit>().isVisible;
                          });
                        },
                        child: Icon(   context.read<SignUpCubit>().isVisible
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Password",
                    textEditingController:    context.read<SignUpCubit>().passwordController,
                    validation: (text) {
                      if (text!.trim().isEmpty) {
                        return "field is empty";
                      }
                      if (text.length < 6) {
                        return "password too short";
                      }

                      return null;
                    },
                    isObscure:    context.read<SignUpCubit>().isVisible,
                  ),
                  TextFormCore(
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            context.read<SignUpCubit>().isVisible = !context.read<SignUpCubit>().isVisible;
                          });
                        },
                        child: Icon(   context.read<SignUpCubit>().isVisible
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Password confirmation",
                    textEditingController:    context.read<SignUpCubit>().passwordConfirmController,
                    validation: (text) {
                      if (text!.trim().isEmpty) {
                        return "field is empty";
                      }
                      if (text.length < 6) {
                        return "password too short";
                      }
                      if (text!=context.read<SignUpCubit>().passwordController.text) {
                        return "not mache";
                      }


                      return null;
                    },
                    isObscure:    context.read<SignUpCubit>().isVisible,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BottomCore(iconText: "register", onPressedFunc: () {
                    isValid(context);
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  const RichTextWidget(),
                  SignUpListenerWidget(),
                ],
              ),
            )),
      ),
    );
  }

  void isValid(BuildContext context) {
    if(context.read<SignUpCubit>().formKey.currentState?.validate()!=false){
      context.read<SignUpCubit>().emitSignUp();
    }
  }
}
