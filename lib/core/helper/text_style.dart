import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themeing/colors_manager.dart';
import 'font_weight_helper.dart';

class TextStyleHelper {
  static TextStyle font32blueBold =
      TextStyle(color: Colors.black, fontSize: 33.sp, fontWeight: FontWeight.bold);
  static TextStyle font15GrayRegular = TextStyle(
      fontSize: 15.sp, fontWeight: FontWeightHelper.regular, color: const Color(0xff757575));
  static TextStyle font16WhiteSemiBold =
      TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeightHelper.semiBold);
  static TextStyle font15DarkGrayMedium = TextStyle(
      color: ColorsManager.lightGrayColor, fontSize: 15.sp, fontWeight: FontWeightHelper.medium);
  static TextStyle font24blueBold =
      TextStyle(color: ColorsManager.blueColor, fontSize: 24.sp, fontWeight: FontWeight.bold);
  static TextStyle font14DarkGrayRegular = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeightHelper.regular, color: ColorsManager.darkGray);
  static TextStyle font18blackeBold =
      TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold);
  static TextStyle font11lightblackRegluer = TextStyle(
      color: ColorsManager.lightBlack, fontSize: 11.sp, fontWeight: FontWeightHelper.regular);
}
