import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/features/home/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  final SpecializationData? specializationData;
  final int indexItem;

  const DoctorsSpecialityListViewItem(
      {super.key, this.specializationData, required this.indexItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: indexItem == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
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
            style: TextStyles.font12DarkBlueRegular,
          )
        ],
      ),
    );
  }
}
