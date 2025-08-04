import 'package:dio/dio.dart';
import 'dart:developer';

import 'package:flutter/foundation.dart';

class BaseDioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("-------------------------------------");
    debugPrint("URL is ${options.uri}");

    debugPrint("Query Parameters is ${options.queryParameters}");

    debugPrint("Data is ${options.data}");

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("-------------------------------------");
    debugPrint(" ✅ The server return success response ✅ ");

    debugPrint("Status code is ${response.statusCode}");

    debugPrint("Status Message is ${response.statusMessage}");

    log("Data is ${response.data}");

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("-------------------------------------");
    debugPrint(" ⛔️ The exception is DioException ⛔️");
    debugPrint("The error type is ${err.type.toString()}");
    debugPrint("The error message is ${err.message.toString()}");
    debugPrint("the error status code is ${err.response?.statusCode}");

    handler.next(err);
  }
}
