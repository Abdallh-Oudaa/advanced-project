import 'package:advanced_project/core/helper/text_style.dart';
import 'package:advanced_project/core/widgets/buttom_core.dart';
import 'package:advanced_project/core/widgets/text_form_core.dart';
import 'package:advanced_project/features/login/ui/widgts/rich_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/email_regex.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 final  formKey = GlobalKey<FormState>();
late bool isVisible=true;
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: formKey,
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
                    textEditingController: emailController,
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
                        onTap: (){
                          isVisible=!isVisible;
                        },
                        child: Icon(isVisible?Icons.visibility:Icons.visibility_off)),
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Password",
                    textEditingController: passwordController,
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
                    height: 20.h,
                  ),
                  BottomCore(iconText: "create account", onPressedFunc: () {}),
                  SizedBox(height: 20.h,),
                  const RichTextWidget(),
                ],

              ),
            )),
      ),
    );
  }
}
