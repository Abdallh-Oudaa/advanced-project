

import 'package:advanced_project/features/signUp/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/email_regex.dart';
import '../../../../core/widgets/text_form_core.dart';

class FieldsSection extends StatefulWidget {
   const FieldsSection({super.key});

  @override
  State<FieldsSection> createState() => _FieldsSectionState();
}

class _FieldsSectionState extends State<FieldsSection> {
  bool isVisible = true;


  @override
  Widget build(BuildContext context) {
    var viewModel=context.read<SignUpCubit>();
    return Column(children: [
      TextFormCore(
        keyboardType: TextInputType.text,
        hintText: "name",
        textEditingController: viewModel.nameController,
        validation: (text) {
          if (text!.trim().isEmpty) {
            return "field is empty";
          }


          return null;
        },
      ),
      SizedBox(
        height: 10.h,
      ),
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
        height: 10.h,
      ),
      TextFormCore(
        keyboardType: TextInputType.number,
        hintText: "phone",
        textEditingController: viewModel.phoneController,
        validation: (text) {
          if (text!.trim().isEmpty) {
            return "field is empty";
          }
          if (text.length<11) {
            return "numbers less than 11";
          }

          return null;
        },
      ),
      SizedBox(
        height: 10.h,
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
      SizedBox(
        height: 10.h,
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
        viewModel.confirmPasswordController,
        validation: (text) {
          if (text!.trim().isEmpty) {
            return "field is empty";
          }
          if (text.length < 6) {
            return "password too short";
          }
          if (viewModel.passwordController.text!=viewModel.confirmPasswordController.text) {
            return "not match password";
          }
          return null;
        },
        isObscure: isVisible,
      ),
    ],);
  }
}
