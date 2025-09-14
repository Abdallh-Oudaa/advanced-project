import 'package:advanced_project/core/helper/extension.dart';
import 'package:advanced_project/core/routing/constant_routes.dart';

import 'package:advanced_project/features/onboarding/widgets/icon_title_widget.dart';
import 'package:advanced_project/features/onboarding/widgets/image_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper/text_style.dart';
import '../../core/widgets/buttom_core.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 10.w, bottom: 5.h),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const IconTitleWidget(),
                const ImageTitleWidget(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Manage and schedule all of your medical appointments "
                          "easily with Docdoc to get a new experience.",
                          style: TextStyleHelper.font15GrayRegular,
                          textAlign: TextAlign.center,
                        ),
                        BottomCore(iconText: "Get Started",onPressedFunc: (){
                          context.pushNamed(ConstantRoutes.loginScreen);
                        },),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
