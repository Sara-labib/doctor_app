import 'package:doctor_app/core/extensions/spacing_extension.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SpecialityShimmerLoading extends StatelessWidget {
  const SpecialityShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
              child: Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: ColorsManager.lightGray,
                    highlightColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  14.heightBox,
                  Shimmer.fromColors(
                      baseColor: ColorsManager.lightGray,
                      highlightColor: Colors.white,
                      child: Container(
                        height: 14.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            color: ColorsManager.lightGray,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      ),
                ],
              ),
            );
          },
          ),
    );
  }
}
