import 'package:doctor_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font248Black700Weight = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.black);

  static TextStyle font328BlueBold = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: ColorsManager.maimBlue);

  static TextStyle font13GrayRegular = TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.normal,
      color: ColorsManager.gray);


       static TextStyle font16SemiBoldWhite = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white);
}
