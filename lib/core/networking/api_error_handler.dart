import 'package:dio/dio.dart';
import 'package:doctor_app/core/networking/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "connection to server failed ");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "request to server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "connection to server timed out");
        case DioExceptionType.unknown:
          return ApiErrorModel(message: "unexpected error occurred");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "receive timeout in connection with server");
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "send timeout in connection with server");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        default:
          return ApiErrorModel(message: "something went wrong");
      }
    } else {
      return ApiErrorModel(message: "something went wrong");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
      message: data["message"] ?? "Unknown error occurred",
      code: data["code"],
      errors: data["data"]);
}
