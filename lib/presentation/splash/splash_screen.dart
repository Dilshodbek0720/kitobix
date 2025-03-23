import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitobix/data/local/storage_repository.dart';
import 'package:kitobix/presentation/app_routes.dart';
import 'package:kitobix/utils/constants/storage_keys.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/screen_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      StorageRepository.getString(StorageKeys.userId).isEmpty
          ? Navigator.pushReplacementNamed(context, RouteNames.onBoardingScreen)
          : Navigator.pushReplacementNamed(context, RouteNames.tabBox);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200 * height / figmaHeight,
          ),
          Center(
            child: SizedBox(
              height: 160.w,
              width: 160.w,
              child: Image.asset(AppIcons.bookLogo),
            ),
          ),
          SizedBox(
            height: 250 * height / figmaHeight,
          ),
          Text(
            "Kitobix",
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Urbanist",
            ),
          ),
        ],
      ),
    );
  }
}
