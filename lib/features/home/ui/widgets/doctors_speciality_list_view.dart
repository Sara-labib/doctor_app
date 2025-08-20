import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28.0,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    "",
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Specialization",
                  style: TextStyles.font12DarkBlueRegular,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
