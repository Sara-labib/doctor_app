import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Omar!",
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              "How Are You Today?",
              style: TextStyles.font12GrayRegular,
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 24.0,
              backgroundColor: ColorsManager.lighterGray,
              backgroundImage: AssetImage('assets/svgs/notification.svg'),
            )
          ],
        )
      ],
    );
  }
}
