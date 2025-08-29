import 'package:doctor_app/core/extensions/spacing_extension.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/core/widgets/app_text_button.dart';
import 'package:doctor_app/features/home/ui/home_screen.dart';
import 'package:doctor_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/presentation/widgets/dont_have_account_text.dart';
import 'package:doctor_app/features/login/presentation/widgets/email_and_password.dart';
import 'package:doctor_app/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:doctor_app/features/login/presentation/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 30.h,
            horizontal: 30.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyles.font24BlueBold,
                ),
                8.heightBox,
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular,
                ),
                36.heightBox,
                Column(
                  children: [
                    const EmailAndPassword(),
                    24.heightBox,
                    _buildForgetPassword(),
                    40.heightBox,
                    _buildLoginButton(context),
                    16.heightBox,
                    const DontHaveAccountText(),
                    60.heightBox,
                    const TermsAndConditionsText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _buildForgetPassword() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Text(
        "Forgot Password",
        style: TextStyles.font13BlueRegular,
      ),
    );
  }

  AppTextButton _buildLoginButton(BuildContext context) {
    return AppTextButton(
        onPressed: () {
          validateThenDoLogin(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        textButton: "Login",
        textStyle: TextStyles.font16WhiteSemiBold);
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}
