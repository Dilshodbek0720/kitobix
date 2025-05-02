import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/size_extension.dart';
import 'package:kitobix/utils/theme/custom_text_style.dart';

class BookItemView extends StatelessWidget {
  const BookItemView({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.slate100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 190 * MediaQuery.sizeOf(context).height / 812,
                width: MediaQuery.sizeOf(context).width / 2,
                child: Image.asset(
                  AppIcons.recommend,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "The Black Witch",
                style: CustomTextStyle.labelMedium(
                  context,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.amber50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "4.5",
                            style: CustomTextStyle.bodyMedium(
                              context,
                            ),
                          ),
                          6.pw,
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              AppIcons.rateStar,
                              colorFilter: const ColorFilter.mode(
                                AppColors.amber500,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
