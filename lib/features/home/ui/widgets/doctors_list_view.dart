import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  "",
                  fit: BoxFit.cover,
                  width: 110.w,
                  height: 120.h,
                ),
              ),
              horizontalSpace(16.w),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name",
                      style: TextStyles.font18DarkBlueBold,
                      overflow: TextOverflow.ellipsis),
                  verticalSpace(5),
                  Text(
                    "Degree | 0123456345",
                    style: TextStyles.font12GrayMedium,
                  ),
                  verticalSpace(5),
                  Text(
                    "Email",
                    style: TextStyles.font12GrayMedium,
                  )
                ],
              ))
            ],
          ),
        );
      },
    ));
  }
}
