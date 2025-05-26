import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';

class RatingStarsWidget extends StatelessWidget {
  final int rating;

  const RatingStarsWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating) {
          return SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              AppIcons.rateStar,
              colorFilter: const ColorFilter.mode(
                AppColors.amber500,
                BlendMode.srcIn,
              ),
            ),
          );
        } else {
          return SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              AppIcons.star,
              colorFilter: const ColorFilter.mode(
                AppColors.amber500,
                BlendMode.srcIn,
              ),
            ),
          );
        }
      }),
    );
  }
}
