
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/text_style.dart';
import '../../../core/themeing/colors_manager.dart';

class ImageTitleWidget extends StatelessWidget {
  const ImageTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Image.asset(
          "assets/images/onborading_image.png",
         // height: 306.h,
        ),
        Container(
          foregroundDecoration:  const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Color(0xff80fffffff),
          ],
             begin: Alignment.bottomCenter,
            end: Alignment.center,
            stops: [0.14,0.9]
          ),
          ),
          child: Image.asset(
            "assets/images/onborading_doctor_image.png",
            height: 491.h,
          ),
        ),
        Positioned(
          bottom: 20.h,
           left: 10.w,
          right: 10.w,
          child: Text(
            "Best Doctor Appointment App",
            style: TextStyleHelper.font32blueBold
                .copyWith(color: ColorsManager.blueColor),textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
