import 'package:docdoc/core/theme/app_colors.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? fillColor;

  const CusTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.hintStyle,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // decoration
      // enabled
      // OutlineInputBorder
      // focused
      // OutlineInputBorder
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.mainBlue,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.lighterGrey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        hintStyle: hintStyle ?? AppStyles.font14LightGreyRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: fillColor ??
            AppColors.secondaryGrey, // required property => filled: true,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: AppStyles.font14DarkBlueMedium,
    );
  }
}
