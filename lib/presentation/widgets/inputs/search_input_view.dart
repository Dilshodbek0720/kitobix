import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/theme/custom_text_style.dart';

class SearchInputView extends StatelessWidget {
  const SearchInputView({
    super.key,
    this.controller,
    this.focusNode,
    this.validator,
    this.hintText,
    required this.onChanged,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FormFieldValidator<String?>? validator;
  final String? hintText;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: CustomTextStyle.labelSmall(
        context,
        color: AppColors.slate900,
      ),
      onChanged: onChanged,
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.slate200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.slate200),
        ),
        fillColor: AppColors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.slate200),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.error500),
        ),
        filled: true,
        hintText: hintText,
        hintStyle: CustomTextStyle.labelSmall(
          context,
          color: AppColors.slate500,
        ),
        errorStyle:
            CustomTextStyle.bodyMedium(context, color: AppColors.error500),
        prefixIcon: SizedBox(
          width: 42,
          height: 40,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 6, 0),
              child: SvgPicture.asset(
                AppIcons.search,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
