import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/login/data/models/login_request_body.dart';
import 'package:doctor_app/features/login/data/repos/login_repo.dart';
import 'package:doctor_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/widgets.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.when(success: (loginResponse) {
      emit( const LoginState.success());
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}