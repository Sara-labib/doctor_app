import 'package:doctor_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String textButton;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  const AppTextButton(
      {super.key,
      this.backgroundColor,
      this.borderRadius,
      this.buttonHeight,
      this.buttonWidth,
      this.horizontalPadding,
      this.verticalPadding,
      required this.onPressed,
      required this.textButton,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
            ),
          ),
          backgroundColor:
              WidgetStatePropertyAll(backgroundColor ?? ColorsManager.maimBlue),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
                vertical: verticalPadding ?? 14.h,
                horizontal: horizontalPadding ?? 12.w),
          ),
          fixedSize: WidgetStatePropertyAll(
            Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 50.h),
          ),
        ),
        onPressed: () {},
        child: Text(
          textButton,
          style: textStyle,
        ));
  }
}
