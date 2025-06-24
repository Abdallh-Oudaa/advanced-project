import 'package:advanced_project/core/helper/text_style.dart';
import 'package:advanced_project/core/themeing/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormCore extends StatelessWidget {
  final String hintText;
  final String? Function(String?) validation;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  final bool isObscure;
  final TextInputType keyboardType;
  const TextFormCore(
      {required this.hintText,
      required this.textEditingController,
      required this.validation,
      required this.keyboardType,
      this.suffixIcon,
      this.isObscure = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorsManager.lightGrayColor, width: 1.5.w),
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.blueColor, width: 2.w),
          borderRadius: BorderRadius.circular(15.r),
        ),
        isDense: true,
        hintStyle: TextStyleHelper.font15GrayRegular,
        hintText: hintText,
        suffix: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        errorStyle:
            TextStyleHelper.font15GrayRegular.copyWith(color: Colors.red),
      ),
      style: TextStyleHelper.font15DarkGrayMedium.copyWith(color: Colors.black),
      controller: textEditingController,
      obscureText: isObscure,
      validator: validation,
      keyboardType: keyboardType,
    );
  }
}
