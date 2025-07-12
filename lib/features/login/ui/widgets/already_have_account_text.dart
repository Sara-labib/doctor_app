import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
              text: "Alreay have an account?",
              style: TextStyles.font13DarkBlueRegular),
          TextSpan(text: "Sign up ", style: TextStyles.font13BlueSemiBold)
        ],
      ),
    );
  }
}
