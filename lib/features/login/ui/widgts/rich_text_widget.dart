import 'package:advanced_project/core/themeing/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/text_style.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin:  EdgeInsets.only(top: 60.h,),
      child: Column(

        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "By logging, you agree to our",
                  style: TextStyleHelper.font14DarkGrayRegular),
              TextSpan(
                  text: "Terms & Conditions",
                  style: TextStyleHelper.font14DarkGrayRegular
                      .copyWith(color: Colors.black)),
              TextSpan(text: "and", style: TextStyleHelper.font14DarkGrayRegular.copyWith(height: 2.h)),
              TextSpan(
                  text: "PrivacyPolicy.",
                  style: TextStyleHelper.font14DarkGrayRegular
                      .copyWith(color: Colors.black)),
            ]),
          ),
          SizedBox(height: 20.h,),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
            TextSpan(
                text: "Already have an account yet?",
                style: TextStyleHelper.font14DarkGrayRegular
                    .copyWith(color: Colors.black)),
                TextSpan(
                    text: "Sign Up",
                    style: TextStyleHelper.font14DarkGrayRegular
                        .copyWith(color: ColorsManager.blueColor)),
          ]))
        ],
      ),
    );
  }
}
