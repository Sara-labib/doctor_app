import 'package:ecommerce_app_omar/core/routing/routes.dart';
import 'package:ecommerce_app_omar/features/login/ui/login_screen.dart';
import 'package:ecommerce_app_omar/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) =>Scaffold(
          appBar: AppBar(
            title: const Text('Unknown Route'),
          ),
          body:  Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}
