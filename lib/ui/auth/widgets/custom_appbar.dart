import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize{
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60.h,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity,72.h);
}
