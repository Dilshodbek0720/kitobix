import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitobix/core/extension/theme_extensions.dart';
import 'package:kitobix/utils/colors/app_colors.dart';

class CustomTextStyle {
  static displayLarge(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate800),
        fontSize: fontSize ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static displayMedium(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate700),
        fontSize: fontSize ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static displaySmall(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate600),
        fontSize: fontSize ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static headlineLarge(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate800),
        fontSize: fontSize ?? 18.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static headlineMedium(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate700),
        fontSize: fontSize ?? 18.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static headlineSmall(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate600),
        fontSize: fontSize ?? 18.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static titleLarge(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate800),
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static titleMedium(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate700),
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static titleSmall(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate600),
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static labelLarge(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate800),
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static labelMedium(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate700),
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static labelSmall(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
    double? height,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate600),
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
        height: height ?? 0,
      );

  static bodyLarge(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate800),
        fontSize: fontSize ?? 12.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static bodyMedium(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate700),
        fontSize: fontSize ?? 12.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );

  static bodySmall(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
  }) =>
      TextStyle(
        color:
            color ?? (context.isDark() ? AppColors.white : AppColors.slate600),
        fontSize: fontSize ?? 12.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily ?? "Inter",
        letterSpacing: letterSpacing ?? 0,
      );
}
