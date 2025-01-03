import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/utils/colors/app_colors.dart';

class NetworkAuthButton extends StatelessWidget {
  const NetworkAuthButton({super.key, required this.icon, required this.onTap});
  final SvgPicture icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: onTap,
      child: DecoratedBox(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.neutral50, width: 1),
      ),
        child: Padding(padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
          child: SizedBox(
            height: 16.h,
            width: 16.h,
            child: icon,
          ),
        ),
      ),
    );
  }
}
