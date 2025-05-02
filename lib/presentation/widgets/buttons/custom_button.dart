import 'package:flutter/material.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/theme/custom_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.title,
    this.color,
    this.textColor,
    this.horizontalPad,
    this.height = 48,
    this.side = BorderSide.none,
    this.enabled = true,
  });

  final VoidCallback? onTap;
  final String title;
  final Color? color;
  final Color? textColor;
  final double? horizontalPad;
  final double? height;
  final BorderSide side;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: horizontalPad == null ? double.infinity : null,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: horizontalPad != null
              ? EdgeInsets.symmetric(horizontal: horizontalPad!)
              : null,
          backgroundColor:
              enabled ? color ?? AppColors.primary500 : AppColors.cE5E5E5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: side,
          ),
        ),
        onPressed: enabled ? onTap : null,
        child: Text(
          title,
          style: CustomTextStyle.labelMedium(
            context,
            color: textColor ?? AppColors.white,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
