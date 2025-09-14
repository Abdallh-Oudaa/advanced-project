
import 'package:advanced_project/features/login/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/email_regex.dart';
import '../../../../core/widgets/text_form_core.dart';

class EmailAndPasswordSection extends StatefulWidget {
   const EmailAndPasswordSection({super.key});

  @override
  State<EmailAndPasswordSection> createState() => _EmailAndPasswordSectionState();
}

class _EmailAndPasswordSectionState extends State<EmailAndPasswordSection> {
  bool isVisible = true;


  @override
  Widget build(BuildContext context) {
    var viewModel=context.read<LoginCubit>();
    return Column(children: [
      TextFormCore(
        keyboardType: TextInputType.emailAddress,
        hintText: "Email",
        textEditingController: viewModel.emailController,
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
              isVisible = !isVisible;
              setState(() {

              });
            },
            child: Icon(isVisible
                ? Icons.visibility_off
                : Icons.visibility)),
        keyboardType: TextInputType.visiblePassword,
        hintText: "Password",
        textEditingController:
        viewModel.passwordController,
        validation: (text) {
          if (text!.trim().isEmpty) {
            return "field is empty";
          }
          if (text.length < 6) {
            return "password too short";
          }

          return null;
        },
        isObscure: isVisible,
      ),
    ],);
  }
}
