import 'package:advanced_project/features/login/logic/login_cubit.dart';
import 'package:advanced_project/features/login/ui/widgts/rich_text_widget.dart';
import 'package:advanced_project/features/signUp/logic/sign_up_cubit.dart';
import 'package:advanced_project/features/signUp/ui/local_widgets/fields_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/text_style.dart';
import '../../../../core/widgets/buttom_core.dart';


class SignUpSection extends StatelessWidget {
  const SignUpSection({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<SignUpCubit>();
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
                      "Create Account",
                      style: TextStyleHelper.font24blueBold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                      style: TextStyleHelper.font15GrayRegular,
                    ),
                    const FieldsSection(),
                    SizedBox(
                      height: 20.h,
                    ),
                    BottomCore(
                        iconText: "Create Account",
                        onPressedFunc: () {
                          if (viewModel.formKey.currentState!.validate()) {
                            viewModel.emitSignUp();
                          }
                        }),
                    SizedBox(
                      height: 20.h,
                    ),

                  ],
                ),
              ),
            )),
      ),
    );
  }


}
