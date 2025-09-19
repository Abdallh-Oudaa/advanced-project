

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/constant_routes.dart';
import 'core/routing/generate_route.dart';
import 'core/themeing/colors_manager.dart';

class DocDoc extends StatelessWidget {
  const DocDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute:GenerateRouts.onGenerateRouts ,
        initialRoute: ConstantRoutes.onBoardingScreen,
        theme: ThemeData(
          primaryColor:ColorsManager.blueColor
        ),
      ),
    );
  }
}
