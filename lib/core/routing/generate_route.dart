import 'package:advanced_project/core/di/dependency_injection.dart';
import 'package:advanced_project/features/home/ui/home_screen.dart';
import 'package:advanced_project/features/login/logic/login_cubit.dart';
import 'package:advanced_project/features/signUp/data/ui/sign_up_screen.dart';
import 'package:advanced_project/features/signUp/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/ui/login_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import 'constant_routes.dart';

class GenerateRouts {
  static Route onGenerateRouts(RouteSettings settings) {
    switch (settings.name) {
      case ConstantRoutes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());
      case ConstantRoutes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: LoginScreen(),
                ));
      case ConstantRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case ConstantRoutes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
                child: const SignUpScreen()));
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
