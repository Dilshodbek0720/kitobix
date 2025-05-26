import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/theme/custom_text_style.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.title = "",
    this.height = 36,
    this.bgColor,
    this.iconColor,
    this.textColor,
    this.isRounded = false,
    this.isDisabled = false,
    this.borderRadius = 12,
    this.isActiveButton = false,
  });

  final VoidCallback onTap;
  final String icon;
  final String title;
  final double height;
  final Color? bgColor;
  final Color? iconColor;
  final Color? textColor;
  final bool isRounded;
  final bool isDisabled;
  final double borderRadius;
  final bool isActiveButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: title.isEmpty ? height : null,
          height: height,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: bgColor ?? AppColors.slate50,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(isRounded ? 100 : borderRadius),
                ),
                padding: const EdgeInsets.all(6)),
            onPressed: isDisabled ? null : onTap,
            child: title.isEmpty
                ? SvgPicture.asset(
                    icon,
                    colorFilter: iconColor != null
                        ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                        : null,
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: bgColor == null ? 6 : 12),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          icon,
                          colorFilter: iconColor != null
                              ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                              : null,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          title,
                          style: CustomTextStyle.labelSmall(
                            context,
                            color: textColor,
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
        isActiveButton
            ? Positioned(
                top: 6,
                right: 4,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.error500,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: AppColors.slate50,
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
