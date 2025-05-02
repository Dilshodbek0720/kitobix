import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitobix/utils/colors/app_colors.dart';

class SeeAllItem extends StatelessWidget {
  const SeeAllItem({super.key, required this.onTap, required this.title});

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onTap,
          child: Text(
            'See All',
            style: TextStyle(
              fontFamily: "Urbanist",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary50,
            ),
          ),
        ),
      ],
    );
  }
}
