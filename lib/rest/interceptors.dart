import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          "--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}");
      print("Headers:");
      options.headers.forEach((k, v) => print('$k: $v'));
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
      if (options.data != null) {
        print("Body: ${options.data}");
      }
      print("--> END ${options.method.toUpperCase()}");
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print("<-- ${response.statusCode} ${(response.realUri)}");
      print("Headers:");
      response.headers.forEach((k, v) => print('$k: $v'));
      print("Response: ${response.data}");
      print("<-- END HTTP");
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      print(
          "<-- ${err.message} ${(err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
      print("${err.response != null ? err.response?.data : 'Unknown Error'}");
      print("<-- End error");
    }
    super.onError(err, handler);
  }
}

class AppInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token;

    // if (kDebugMode) {
    //   print('Firebase token : $token');
    // }
    //
    // try {
    //   if (token != null) {
    //     if (token.isNotEmpty) {
    //       options.headers.addAll({
    //         "Authorization": "Firebase $token",
    //       });
    //     }
    //   }
    // } catch (e) {
    //   if (kDebugMode) {
    //     print(e);
    //   }
    // }
    super.onRequest(options, handler);
  }
}
