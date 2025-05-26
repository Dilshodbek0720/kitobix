import 'package:flutter/material.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/presentation/auth/sign_in/sign_in_screen.dart';
import 'package:kitobix/presentation/auth/sign_up/sign_up_screen.dart';
import 'package:kitobix/presentation/on_boarding/carousel_pages/on_boarding_pages.dart';
import 'package:kitobix/presentation/splash/splash_screen.dart';
import 'package:kitobix/presentation/tab_box/home/pages/add_book/add_book_screen.dart';
import 'package:kitobix/presentation/tab_box/home/pages/audio_viewer/audio_viewer_screen.dart';
import 'package:kitobix/presentation/tab_box/home/pages/detail_book/detail_book_screen.dart';
import 'package:kitobix/presentation/tab_box/home/pages/pdf_viewer/pdf_viewer_screen.dart';
import 'package:kitobix/presentation/tab_box/tab_box.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String onBoardingScreen = "/on_boarding";
  static const String signInScreen = "/sign_in_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String tabBox = "/tab_box";
  static const String addBookScreen = "/add_book_screen";
  static const String detailBookScreen = "/detail_book_screen";
  static const String pdfViewerScreen = "/pdf_viewer_screen";
  static const String audioViewerScreen = "/audio_viewer_screen";
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
      case RouteNames.detailBookScreen:
        return MaterialPageRoute(
          builder: (context) =>
              DetailBookScreen(bookModel: settings.arguments as BookModel),
        );
      case RouteNames.pdfViewerScreen:
        return MaterialPageRoute(
          builder: (context) => PdfViewerPage(
            bookModel: settings.arguments as BookModel,
          ),
        );
      case RouteNames.audioViewerScreen:
        return MaterialPageRoute(
          builder: (context) => AudioViewerScreen(
            bookModel: settings.arguments as BookModel,
          ),
        );
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
