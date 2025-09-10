import 'package:doctor_app/core/extensions/navigation_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: "data")
  final Map<String, dynamic>? errors;

  ApiErrorModel({this.errors, this.message, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  get apiErrorModel => null;

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getAllErrorMessages() {
    if (errors.isNullOrEmpty()) return message ?? "Unknown error occurred";
    final errorMessage = errors!.entries.map((entry) {
      final value = entry.value;
      return "${value.join(",")}";
    }).join("\n");
    return errorMessage;
  }
}
