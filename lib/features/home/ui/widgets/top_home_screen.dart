import 'package:advanced_project/core/helper/text_style.dart';
import 'package:advanced_project/core/themeing/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopHomeScreen extends StatelessWidget {
  const TopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "Hi Aoda",
                style: TextStyleHelper.font18blackeBold,
              ),
              Text(
                "How Are you Today",
                style: TextStyleHelper.font11lightblackRegluer,
              )
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 42.r,
            backgroundColor: ColorsManager.lightGrayColor,
            child: SvgPicture.asset("assets/svgs/notifcationSVg.svg"),
          ),
        ],
      ),
    );
  }
}
