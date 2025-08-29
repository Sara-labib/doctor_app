import 'package:doctor_app/core/extensions/spacing_extension.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/features/home/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorsModel;
  const DoctorsListViewItem({super.key, this.doctorsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              "assets/images/doctor_list_view.jpg",
              fit: BoxFit.cover,
              width: 110.w,
              height: 120.h,
            ),
          ),
          16.widthBox,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doctorsModel?.name ?? "Name",
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis),
              8.heightBox,
              Text(
                '${doctorsModel?.degree} | ${doctorsModel?.phone}',
                style: TextStyles.font12GrayMedium,
              ),
              8.heightBox,
              Text(
                doctorsModel?.email ?? "Email",
                style: TextStyles.font12GrayMedium,
              )
            ],
          ))
        ],
      ),
    );
  }
}
