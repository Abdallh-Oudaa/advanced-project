import 'package:advanced_project/core/helper/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconTitleWidget extends StatelessWidget{
  const IconTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      SvgPicture.asset("assets/svgs/onborading_docdoc_icon.svg"),
      SizedBox(width: 5.w,),
      Text("Docdoc",style: TextStyleHelper.font32blueBold,),
    ],);
  }

}