import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  ///private constructor
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzU2MDY4MTkyLCJleHAiOjE3NTYxNTQ1OTIsIm5iZiI6MTc1NjA2ODE5MiwianRpIjoibGlyWlJ1dkY3d3hCdHFsRSIsInN1YiI6IjQ2NzkiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.TVS722gsuftB4ft2gv8tJTErKy2F3X-suZtS8HLx9QY',};
  }

  static void addDioInterceptors() {
    dio!.interceptors.add(PrettyDioLogger(
        requestBody: true, requestHeader: true, responseHeader: true));
  }
}
