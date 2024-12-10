import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitobix/main.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/screen_size.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
      return Scaffold(
        body: Column(
        children: [
          SizedBox(height: 200*height/figmaHeight,),
          Center(
            child: SizedBox(height: 160.w, width: 160.w,
              child: Image.asset(AppIcons.bookLogo),
            ),
          ),
          SizedBox(height: 250*height/figmaHeight,),
          Text("Kitobix", style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Urbanist",
          ),)
        ],
        ),
      );
  }
}
