import 'package:doctor_app/core/extensions/navigation_extension.dart';
import 'package:doctor_app/core/networking/api_error_model.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is LoginLoading ||
            current is LoginSuccess ||
            current is LoginError,
        listener: (context, state) {
          state.whenOrNull(
            loginLoading: () {
              showDialog(
                  context: context,
                  builder: (context) => const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainBlue,
                        ),
                      ));
            },
            loginSuccess: () {
              Navigator.pop(context);
              Navigator.of(context, rootNavigator: true)
                  .pushReplacementNamed(Routes.homeScreen);
            },
            loginError: (apiErrorModel) =>
                setupErrorState(context, apiErrorModel),
          );
        },
        child: const SizedBox.shrink());
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          apiErrorModel.getAllErrorMessages(),
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
