import 'package:advanced_project/core/routing/constant_routes.dart';
import 'package:advanced_project/features/login/ui/login_screen.dart';
import 'package:advanced_project/features/onboarding/onboarding_screen.dart';

import 'package:flutter/material.dart';

class GenerateRouts {
  static Route onGenerateRouts(RouteSettings settings) {
    switch (settings.name) {
      case ConstantRoutes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());
      case ConstantRoutes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("no page found"),
            ),
          ),
        );
    }
  }
}
