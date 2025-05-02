import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/theme/custom_text_style.dart';

class TextInputView extends StatefulWidget {
  const TextInputView({
    super.key,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.caption,
    this.isRequired = false,
    this.validator,
    this.isPasswordClosed = true,
    this.onPasswordSuffixTap,
    this.hintText,
    this.enabled = true,
    this.maxLines = 1,
    this.isNumber = false,
    this.isDecimal = false,
    this.isInteger = false,
    this.enablePhoneFormatter = false,
    this.inputFormatters = const <TextInputFormatter>[],
    this.extraCaption,
    this.padding,
    this.keyboardType = TextInputType.text,
  });

  final String? initialValue;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final String? caption;
  final bool isRequired;
  final FormFieldValidator<String?>? validator;
  final VoidCallback? onPasswordSuffixTap;
  final bool isPasswordClosed;
  final String? hintText;
  final bool? enabled;
  final int? maxLines;
  final bool isNumber;
  final bool isDecimal;
  final bool isInteger;
  final bool enablePhoneFormatter;
  final List<TextInputFormatter> inputFormatters;
  final String? extraCaption;
  final EdgeInsets? padding;
  final TextInputType keyboardType;

  @override
  State<TextInputView> createState() => _TextInputViewMobileState();
}

class _TextInputViewMobileState extends State<TextInputView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.caption != null)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  widget.caption!,
                  style: CustomTextStyle.labelLarge(context,
                      fontWeight: FontWeight.w500),
                ),
                if (widget.isRequired)
                  Text(
                    "*",
                    style: CustomTextStyle.labelLarge(
                      context,
                      fontWeight: FontWeight.w500,
                      color: AppColors.error500,
                    ),
                  ),
                if (widget.extraCaption != null) const Spacer(),
                if (widget.extraCaption != null)
                  Text(
                    widget.extraCaption!,
                    style: CustomTextStyle.labelLarge(context,
                        fontWeight: FontWeight.w500),
                  ),
              ],
            ),
          ),
        const SizedBox(height: 5),
        TextFormField(
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          style: CustomTextStyle.labelSmall(
            context,
            color: AppColors.slate900,
          ),
          keyboardType: (widget.isNumber || widget.isDecimal)
              ? TextInputType.numberWithOptions(decimal: widget.isDecimal)
              : widget.keyboardType,
          inputFormatters: <TextInputFormatter>[
            if (widget.isNumber) FilteringTextInputFormatter.digitsOnly,
            if (widget.isDecimal) _DecimalInputFormatter(),
            if (widget.isInteger) _IntegerInputFormatter(),
            ...widget.inputFormatters,
          ],
          maxLines: widget.maxLines,
          enabled: widget.enabled,
          controller: widget.controller,
          focusNode: widget.focusNode,
          validator: widget.validator,
          obscureText: widget.onPasswordSuffixTap != null
              ? widget.isPasswordClosed
              : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            contentPadding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            errorMaxLines: 2,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.slate200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.slate200),
            ),
            fillColor: AppColors.slate50,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.slate200),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.error500),
            ),
            filled: true,
            hintText: widget.hintText ?? widget.caption,
            hintStyle: CustomTextStyle.labelSmall(
              context,
              color: AppColors.cA3A3A3,
            ),
            errorStyle: const TextStyle(
              height: 0.0,
              fontSize: 11,
            ),
            suffixIcon: widget.onPasswordSuffixTap != null
                ? SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(4),
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        onPressed: widget.onPasswordSuffixTap,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            widget.isPasswordClosed
                                ? AppIcons.show
                                : AppIcons.hide,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class _DecimalInputFormatter extends TextInputFormatter {
  // The number of allowed decimal places
  final int decimalPlaces = 3;

  _DecimalInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final RegExp validDecimalRegExp =
        RegExp(r'^\d*(\.\d{0,' + decimalPlaces.toString() + r'})?$');

    if (validDecimalRegExp.hasMatch(newValue.text)) {
      return newValue;
    }

    return oldValue;
  }
}

class _IntegerInputFormatter extends TextInputFormatter {
  _IntegerInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final RegExp validIntegerRegExp = RegExp(r'^-?\d*$');

    if (validIntegerRegExp.hasMatch(newValue.text)) {
      return newValue;
    }

    return oldValue;
  }
}
