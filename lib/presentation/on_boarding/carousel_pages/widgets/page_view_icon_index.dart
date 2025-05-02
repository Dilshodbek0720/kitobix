import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/theme/get_theme.dart';

class PageIndexItem extends StatelessWidget {
  const PageIndexItem({
    super.key,
    required this.activePageIndex,
  });

  final int activePageIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        activePageIndex == 0
            ? Container(
                height: 12.w,
                width: 12.w,
                decoration: BoxDecoration(
                  color: getTheme(context)
                      ? AppColors.primary500
                      : AppColors.accent50,
                  borderRadius: BorderRadius.circular(100),
                ),
              )
            : Container(
                height: 12.w,
                width: 12.w,
                decoration: BoxDecoration(
                  color: getTheme(context)
                      ? AppColors.neutral80
                      : AppColors.uzum600,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
        SizedBox(width: width / 80),
        activePageIndex == 1
            ? Container(
                height: 12.w,
                width: 12.w,
                decoration: BoxDecoration(
                  color: getTheme(context)
                      ? AppColors.primary500
                      : AppColors.accent50,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              )
            : Container(
                height: 12.w,
                width: 12.w,
                decoration: BoxDecoration(
                  color: getTheme(context)
                      ? AppColors.neutral80
                      : AppColors.uzum600,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
        SizedBox(width: width / 80),
        activePageIndex == 2
            ? Container(
                height: 12.w,
                width: 12.w,
                decoration: BoxDecoration(
                  color: getTheme(context)
                      ? AppColors.primary500
                      : AppColors.accent50,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              )
            : Container(
                height: 12.w,
                width: 12.w,
                decoration: BoxDecoration(
                  color: getTheme(context)
                      ? AppColors.neutral80
                      : AppColors.uzum600,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
      ],
    );
  }
}
