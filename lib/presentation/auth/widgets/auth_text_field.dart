import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.onChanged,
    required this.focusNode,
    this.parolkoz,
  });

  final String hintText;
  final String? parolkoz;
  final FocusNode focusNode;
  final bool isPassword;
  final ValueChanged<String> onChanged;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _isObscured = false;
  bool isFocused = false;
  Color _iconColor = AppColors.neutral80;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        if (widget.focusNode.hasFocus) {
          setState(() {
            _iconColor = AppColors.neutral40;
          });
        } else {
          setState(() {
            _iconColor = AppColors.neutral80;
          });
        }
      } else {
        if (widget.focusNode.hasFocus) {
          setState(() {
            _iconColor = AppColors.neutral40;
          });
        } else {
          setState(() {
            _iconColor = AppColors.neutral80;
          });
        }
      }
    });
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        setState(() {
          _iconColor = AppColors.neutral40;
        });
      } else {
        if (_controller.text.isNotEmpty) {
          setState(() {
            _iconColor = AppColors.neutral40;
          });
        } else {
          setState(() {
            _iconColor = AppColors.neutral80;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:
          widget.isPassword ? TextInputType.text : TextInputType.emailAddress,
      textInputAction:
          widget.isPassword ? TextInputAction.done : TextInputAction.go,
      focusNode: widget.focusNode,
      controller: _controller,
      obscureText: widget.parolkoz == null ? _isObscured : !_isObscured,
      onChanged: widget.onChanged,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: AppColors.neutral80,
          fontSize: 16.sp,
          fontFamily: "Urbanist",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2),
      decoration: InputDecoration(
          counterText: "",
          contentPadding:
              EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
          hintText: widget.hintText,
          hintStyle: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: AppColors.neutral40,
              fontSize: 16.sp,
              fontFamily: "Urbanist",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.2),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                  icon: SvgPicture.asset(
                    _isObscured ? AppIcons.show : AppIcons.hide,
                    colorFilter: ColorFilter.mode(_iconColor, BlendMode.srcIn),
                  ))
              : const SizedBox(),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.c_50)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.c_50)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(width: 1.w, color: AppColors.c_50)),
          fillColor: AppColors.neutral5,
          filled: true),
    );
  }
}
