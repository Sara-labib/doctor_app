import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.enabledBorder,
      this.focusedBorder,
      this.inputTextStyle,
      this.hintStyle,
      required this.hintText,
      this.isObscureText,
      this.suffixIcon,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorsManager.maimBlue, width: 1.3),
                  borderRadius: BorderRadius.circular(16)),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorsManager.lighterGray, width: 1.3),
                borderRadius: BorderRadius.circular(16),
              ),
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
          suffixIcon: suffixIcon,
          fillColor: ColorsManager.moreLightGray,
          filled: true),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
    );
  }
}
