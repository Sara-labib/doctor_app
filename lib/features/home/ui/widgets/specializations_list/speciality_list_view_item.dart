import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/features/home/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  final SpecializationData? specializationData;
  final int indexItem;
  final int selectedindex;

  const SpecialityListViewItem(
      {super.key,
      this.specializationData,
      required this.indexItem,
      required this.selectedindex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: indexItem == 0 ? 0 : 24.w),
      child: Column(
        children: [
          indexItem == selectedindex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.darkBlue,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                      radius: 28,
                      backgroundColor: ColorsManager.lightBlue,
                      child: SvgPicture.asset(
                        "assets/svgs/docdoc_logo.svg",
                        height: 42.h,
                        width: 42.w,
                      )),
                )
              : CircleAvatar(
                  radius: 28.0,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    "assets/svgs/docdoc_logo.svg",
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
          const SizedBox(height: 8.0),
          Text(
            specializationData?.name ?? "Specialization",
            style: indexItem == selectedindex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          )
        ],
      ),
    );
  }
}
