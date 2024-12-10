import 'package:flutter/material.dart';
import 'package:kitobix/ui/on_boarding/carousel_pages/on_boarding_pages.dart';
import 'package:kitobix/ui/splash/splash_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String onBoardingScreen = "/on_boarding";
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
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(child: Text("Route Not Found!!!"),),
            ),
        );
    }
  }
}