import 'package:flutter/material.dart';
import 'package:kitobix/presentation/auth/sign_in/sign_in_screen.dart';
import 'package:kitobix/presentation/auth/sign_up/sign_up_screen.dart';
import 'package:kitobix/presentation/on_boarding/carousel_pages/on_boarding_pages.dart';
import 'package:kitobix/presentation/splash/splash_screen.dart';
import 'package:kitobix/presentation/tab_box/home/pages/add_book/add_book_screen.dart';
import 'package:kitobix/presentation/tab_box/tab_box.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String onBoardingScreen = "/on_boarding";
  static const String signInScreen = "/sign_in_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String tabBox = "/tab_box";
  static const String addBookScreen = "/add_book_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => const OnBoardingPages());
      case RouteNames.signInScreen:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case RouteNames.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context) => const TabBox());
      case RouteNames.addBookScreen:
        return MaterialPageRoute(builder: (context) => const AddBookScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route Not Found!!!"),
            ),
          ),
        );
    }
  }
}
