import 'package:flutter/material.dart';
import 'package:kitobix/ui/auth/sign_in/sign_in_screen.dart';
import 'package:kitobix/ui/on_boarding/carousel_pages/on_boarding_pages.dart';
import 'package:kitobix/ui/splash/splash_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String onBoardingScreen = "/on_boarding";
  static const String signInScreen = "/sign_in_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings){
    switch (settings.name){
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen()
        );
      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingPages()
        );
      case RouteNames.signInScreen:
        return MaterialPageRoute(
            builder: (context) => const SignInScreen()
        );
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(child: Text("Route Not Found!!!"),),
            ),
        );
    }
  }
}