import 'package:doctor_app/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "sign_up_state.freezed.dart";

@freezed
class SignupState<T> with _$SignupState<T> {
  factory SignupState.initial() = _Initial;

  const factory SignupState.signupLoading() = SignupLoading;
  const factory SignupState.signupSuccess(T data) = SignupSuccess;
  const factory SignupState.signupError( ApiErrorModel apiErrorModel) = SignupError;
}
