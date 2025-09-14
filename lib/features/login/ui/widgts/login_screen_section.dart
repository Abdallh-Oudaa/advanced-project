import 'package:advanced_project/features/login/logic/login_cubit.dart';
import 'package:advanced_project/features/login/ui/widgts/rich_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/text_style.dart';
import '../../../../core/widgets/buttom_core.dart';
import 'email_and_password_section.dart';

class LoginScreenSection extends StatelessWidget {
  const LoginScreenSection({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<LoginCubit>();
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyleHelper.font24blueBold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                      style: TextStyleHelper.font15GrayRegular,
                    ),
                    const EmailAndPasswordSection(),
                    SizedBox(
                      height: 20.h,
                    ),
                    BottomCore(
                        iconText: "login",
                        onPressedFunc: () {
                          if (viewModel.formKey.currentState!.validate()) {
                            viewModel.emitLogin();
                          }
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                    const RichTextWidget(),
                  ],
                ),
              ),
            )),
      ),
    );
  }


}
