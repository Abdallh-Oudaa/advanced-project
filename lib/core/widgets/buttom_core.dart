

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/text_style.dart';
import '../themeing/colors_manager.dart';

class BottomCore extends StatelessWidget{
  final String iconText;
  final void Function() onPressedFunc;
  const BottomCore({super.key,required this.iconText,required this.onPressedFunc});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      width: double.infinity,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  ColorsManager.blueColor),
              shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius:
                      BorderRadiusGeometry.circular(
                          15.r)))),
          onPressed: onPressedFunc,
          child: Text(
            iconText,
            style: TextStyleHelper.font16WhiteSemiBold,
          )),
    );
  }

}