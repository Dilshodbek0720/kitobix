import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitobix/utils/colors/app_colors.dart';

class AuthNavigatorButton extends StatelessWidget {
  const AuthNavigatorButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.onTapTitle});

  final String title;
  final String onTapTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.neutral80,
            fontFamily: "Urbanist",
            fontSize: 16.sp,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            onTapTitle,
            style: TextStyle(
              color: AppColors.accent50,
              fontFamily: "Urbanist",
              fontSize: 16.sp,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    );
  }
}
