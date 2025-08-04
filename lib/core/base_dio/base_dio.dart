// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'base_dio_interceptors.dart';
import 'data_state.dart';
import 'errors_types_enum.dart';
import 'general_model.dart';
import '../constant/constant.dart';

import '../services/shared_preferences_service.dart';

class BaseDio {
  final Dio dioProject;
  final SharedPreferencesService sharedPreferencesService;
  BaseDio({required this.dioProject, required this.sharedPreferencesService}) {
    dioProject.interceptors.add(BaseDioInterceptors());
  }
  Future<DataState> get<T extends GeneralModel>({
    required String subUrl,
    String? token,
    String? url,
    bool needToken = false,
    required dynamic model,
    Object? data,
    bool isListOfModel = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (needToken) {
      final storedToken = sharedPreferencesService.getToken();
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? storedToken}";

      debugPrint("The token is $storedToken");
    }

    try {
      final response = await dioProject.get("${url ?? Constant.baseUrl}$subUrl",
          queryParameters: queryParameters, data: data);

      final responseData = json.decode(response.data)["data"];

      if (isListOfModel) {
        final List<T> dataList = [];
        responseData.forEach((customModel) {
          dataList.add(model.fromJson(customModel));
        });
        debugPrint("the reponse modeled");
        return DataSuccess(dataList);
      }

      final responseObject = model.fromJson(responseData);
      debugPrint("the reponse modeled");
      return DataSuccess(responseObject);
    } on DioException catch (e) {
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      debugPrint("-----------------------------------------------");
      debugPrint("The exception is Other: ${e.toString()}");
      debugPrint("-----------------------------------------------");
      debugPrint("The StackTrace $stacktrace");
      debugPrint("--------------End of Stacktrace----------------");
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }

  Future<DataState> post<T extends GeneralModel>({
    required String subUrl,
    dynamic data,
    String? token,
    String? url,
    bool needToken = false,
    // T? model,
    dynamic model,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (needToken) {
      final storedToken = sharedPreferencesService.getToken();
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? storedToken}";

      debugPrint("The token is $storedToken");
    }

    try {
      final response = await dioProject.post(
          "${url ?? Constant.baseUrl}$subUrl",
          queryParameters: queryParameters,
          data: data);
      final responseData = json.decode(response.data)["data"];
      final responseObject = model?.fromJson(responseData);
      print("the reponse modeled");
      return DataSuccess(responseObject);
    } on DioException catch (e) {
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed(exceptionResponse);
    } catch (e, stacktrace) {
      debugPrint("-----------------------------------------------");
      debugPrint("The exception is Other: ${e.toString()}");
      debugPrint("-----------------------------------------------");
      debugPrint("The StackTrace $stacktrace");
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed(exceptionResponse);
    }
  }

  Future<DataState> delete(
      {required String subUrl,
      dynamic data,
      String? token,
      Map<String, dynamic>? queryParameters,
      bool needToken = false}) async {
    if (needToken) {
      final storedToken = sharedPreferencesService.getToken();
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? storedToken}";

      debugPrint("The token is $storedToken");
    }
    try {
      var response = await dioProject.delete("${Constant.baseUrl}$subUrl",
          data: data, queryParameters: queryParameters);
      return DataSuccess(response);
    } on DioException catch (e) {
      print(e.stackTrace);
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      print(e);
      print('Stacktrace: $stacktrace');
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }

  // Future<DataState> getPagination<T extends GeneralModel>(
  //     {required String subUrl,
  //     String? token,
  //     String? url,
  //     required dynamic model,
  //     required PaginateReqEntity paginateReqEntity,
  //     bool needToken = false,
  //     Object? data,
  //     Map<String, dynamic>? queryParameters}) async {
  //   if (needToken) {
  //     dioProject.options.headers["Authorization"] =
  //         "Bearer ${token ?? LocalStaticVar.token}";
  //   }
  //   try {
  //     var response = await dioProject.get("${url ?? Constant.baseUrl}$subUrl",
  //         queryParameters: queryParameters, data: data);

  //     final pageData = PaginationModel.fromJson(json.decode(response.data));
  //     final List<T> dataList = [];
  //     pageData.data?.forEach((modelData) {
  //       dataList.add(model.fromJson(modelData));
  //     });
  //     int totalPage =
  //         ((pageData.pagination?.totalpage ?? 10) / paginateReqEntity.perPage)
  //             .ceil();
  //     var result = PageEntity<T>(data: dataList, totalPage: totalPage);

  //     return DataSuccess(result);
  //   } on DioException catch (e) {
  //     print(e.stackTrace);
  //     final ExceptionResponse exceptionResponse = getExceptionResponse(e);
  //     return DataFailed<ExceptionResponse>(exceptionResponse);
  //   } catch (e, stacktrace) {
  //     print(e);
  //     print('Stacktrace: $stacktrace');
  //     final ExceptionResponse exceptionResponse = ExceptionResponse(
  //         statusCode: -888,
  //         exceptionMessages: ["Another exception was thrown"]);
  //     return DataFailed<ExceptionResponse>(exceptionResponse);
  //   }
  // }
  Future<DataState> basePost({
    required String subUrl,
    dynamic data,
    String? token,
    String? url,
    bool needToken = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (needToken) {
      final storedToken = sharedPreferencesService.getToken();
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? storedToken}";

      debugPrint("The token is $storedToken");
    }

    try {
      final response = await dioProject.post(
          "${url ?? Constant.baseUrl}$subUrl",
          queryParameters: queryParameters,
          data: data);

      final responseData = json.decode(response.data);

      return DataSuccess(responseData);
    } on DioException catch (e) {
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      debugPrint("-----------------------------------------------");
      debugPrint("The exception is Other: ${e.toString()}");
      debugPrint("-----------------------------------------------");
      debugPrint("The StackTrace $stacktrace");
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }

  Future<DataState> baseGet<T extends GeneralModel>({
    required String subUrl,
    String? token,
    String? url,
    bool needToken = false,
    required dynamic model,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (needToken) {
      final storedToken = sharedPreferencesService.getToken();
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? storedToken}";

      debugPrint("The token is $storedToken");
    }

    try {
      final response = await dioProject.get("${url ?? Constant.baseUrl}$subUrl",
          queryParameters: queryParameters, data: data);

      final responseData = json.decode(response.data);

      final responseObject = model.fromJson(responseData);
      debugPrint("the reponse modeled");
      return DataSuccess(responseObject);
    } on DioException catch (e) {
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      debugPrint("-----------------------------------------------");
      debugPrint("The exception is Other: ${e.toString()}");
      debugPrint("-----------------------------------------------");
      debugPrint("The StackTrace $stacktrace");
      debugPrint("--------------End of Stacktrace----------------");
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }
}
