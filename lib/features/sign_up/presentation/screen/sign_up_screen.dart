import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_app/features/sign_up/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:doctor_app/features/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/spacing_extension.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../login/presentation/widgets/terms_and_conditions_text.dart';
import '../cubit/sign_up_cubit.dart';
import '../widgets/already_have_account_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                8.heightBox,
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                40.heightBox,
                Column(
                  children: [
                    const SignupForm(),
                    40.heightBox,
                    AppTextButton(
                      textButton: "Create Account",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    16.heightBox,
                    const TermsAndConditionsText(),
                    30.heightBox,
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    if (signupCubit.formKey.currentState!.validate()) {
      signupCubit.emitSignupStates();
    }
  }
}
