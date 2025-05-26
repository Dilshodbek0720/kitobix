import 'package:flutter/material.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/theme/custom_text_style.dart';

import 'buttons/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar(
      {super.key, required this.title, required this.isLeading, this.actions});

  final String title;
  final bool isLeading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: isLeading
          ? Center(
              child: CustomIconButton(
                onTap: () {
                  Navigator.pop(context);
                },
                icon: AppIcons.arrowLeft,
              ),
            )
          : null,
      title: Text(
        title,
        maxLines: 1,
        style: CustomTextStyle.headlineMedium(
          context,
          color: AppColors.neutral80,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      actions: actions,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
