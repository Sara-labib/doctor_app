import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Spacing on num {
  SizedBox get widthBox => SizedBox(width: toDouble().w);
  SizedBox get heightBox => SizedBox(height: toDouble().h);
}
