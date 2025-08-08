// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:medicare_pharmacy/core/models/collection_model.dart';

import 'tools_helper.dart';
import 'dart:io';

void main(List<String> args) async {
  final file = File('D:/collection_json/json_collection.json');
  final jsonString = await file.readAsString();

  final collection = CollectionModel.fromJson(json.decode(jsonString));

  final toolsTestDir = Directory("lib/data");
  // Check if the directory exists
  await ToolsHelper.createDirectoryIfNotExists(toolsTestDir);

  final outPutDataSourceFile = File(
    "${toolsTestDir.path}/remote_data_source.dart",
  );
  final outPutRepoFile = File("${toolsTestDir.path}/repository.dart");

  final StringBuffer methodBuffer = StringBuffer();
  final StringBuffer repoBuffer = StringBuffer();

  for (Item item in collection.item ?? []) {
    final request = _generateRequest(item);
    final repsitoryRequest = _generateRepoRequest(item);
    methodBuffer.writeln(request);
    repoBuffer.writeln(repsitoryRequest);
  }

  final outputBuffer = StringBuffer('''
import 'package:medicare_pharmacy/core/base_dio/base_dio.dart' show BaseDio;
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
class RemoteDataSource {
  final BaseDio baseDio;

  RemoteDataSource({required this.baseDio});

${methodBuffer.toString()}
}
''');

  final outputRepoBuffer = StringBuffer('''
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/remote_data_source.dart';

class Repository {
  final RemoteDataSource _remoteDataSource;

  Repository({required RemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

    ${repoBuffer.toString()}

}

''');

  outPutDataSourceFile.writeAsStringSync(outputBuffer.toString());
  print('✅ Generated RemoteDataSource saved to ${outPutDataSourceFile.path}');

  outPutRepoFile.writeAsStringSync(outputRepoBuffer.toString());
  print('✅ Generated Repository saved to ${outPutRepoFile.path}');
}

String _generateRepoRequest(Item request) {
  final StringBuffer params = StringBuffer();
  final String methodName = ToolsHelper.varCamelCase(
    request.name ?? "",
    comma: "-",
  );

  Map<String, dynamic> bodyMap = {};
  if (request.request?.body != null &&
      request.request!.body?.raw != null &&
      request.request!.body!.raw.toString().trim().isNotEmpty) {
    try {
      bodyMap = jsonDecode(request.request!.body!.raw!);
    } catch (_) {
      print("No valid body for ${request.name}");
    }
  }

  // add body fields to method params
  params.write(
    bodyMap.keys
        .map((k) => '    required String ${ToolsHelper.varCamelCase(k)}')
        .join(',\n'),
  );

  Map<String, dynamic> queryMap = {};
  if (request.request?.url != null &&
      request.request!.url!.query != null &&
      request.request!.url!.query.toString().trim().isNotEmpty) {
    try {
      // queryMap = jsonDecode(request.request!.url!.query!);
      // queryMap = request.request!.url!.query!.map((element) => {element.key: ""},);
      for (var queryObject in request.request!.url!.query!) {
        queryMap.addAll({queryObject.key ?? "": ""});
      }
    } catch (_) {
      print("No valid query for ${request.name}");
    }
  }

  // add body fields to method params
  params.write(
    queryMap.keys
        .map((k) => '    required String ${ToolsHelper.varCamelCase(k)}')
        .join(',\n'),
  );

  final matchParams = StringBuffer();

  matchParams.write(
    bodyMap.keys
        .map(
          (k) =>
              '${ToolsHelper.varCamelCase(k)} : ${ToolsHelper.varCamelCase(k)}',
        )
        .join(',\n'),
  );
  matchParams.write(
    queryMap.keys
        .map(
          (k) =>
              '${ToolsHelper.varCamelCase(k)} : ${ToolsHelper.varCamelCase(k)}',
        )
        .join(',\n'),
  );

  final repoRequest = '''
  Future<DataState> $methodName(
      ${params.isEmpty ? '' : '{ ${params.toString()} }'}
  ) async {
    final response = await _remoteDataSource.$methodName(
      ${matchParams.isEmpty ? "" : matchParams.toString()}
    );

    return response;
  }

''';

  print(
    "The Request ${request.name} of type: ${request.request?.method} Generated to repo",
  );

  return repoRequest;
}

String _generateRequest(Item request) {
  final StringBuffer params = StringBuffer();

  // Get the method type
  final methodType = request.request?.method.toString().toLowerCase() ?? "";

  // Get the method name
  final String methodName = ToolsHelper.varCamelCase(
    request.name ?? "",
    comma: "-",
  );

  // Get the body
  // first check if it is empty
  Map<String, dynamic> bodyMap = {};
  if (request.request?.body != null &&
      request.request!.body?.raw != null &&
      request.request!.body!.raw.toString().trim().isNotEmpty) {
    try {
      bodyMap = jsonDecode(request.request!.body!.raw!);
    } catch (_) {
      print("No valid body for ${request.name}");
    }
  }

  // add body fields to method params
  params.write(
    bodyMap.keys
        .map((k) => '    required String ${ToolsHelper.varCamelCase(k)}')
        .join(',\n'),
  );

  // create the body map
  final dataMap = bodyMap.keys
      .map((k) => '      "$k": ${ToolsHelper.varCamelCase(k)}')
      .join(',\n');

  // Get the query params
  // first check if it is empty
  Map<String, dynamic> queryMap = {};
  if (request.request?.url != null &&
      request.request!.url!.query != null &&
      request.request!.url!.query.toString().trim().isNotEmpty) {
    try {
      // queryMap = jsonDecode(request.request!.url!.query!);
      // queryMap = request.request!.url!.query!.map((element) => {element.key: ""},);
      for (var queryObject in request.request!.url!.query!) {
        queryMap.addAll({queryObject.key ?? "": ""});
      }
    } catch (_) {
      print("No valid query for ${request.name}");
    }
  }

  // add body fields to method params
  params.write(
    queryMap.keys
        .map((k) => '    required String ${ToolsHelper.varCamelCase(k)}')
        .join(',\n'),
  );

  // create the body map
  final queryMapData = queryMap.keys
      .map((k) => '      "$k": ${ToolsHelper.varCamelCase(k)}')
      .join(',\n');

  final String subUrl = ToolsHelper.extractPath(
    request.request?.url?.raw ?? "",
  );

  final postString = '''

    Future<DataState> $methodName(

      ${params.isEmpty ? '' : '{ ${params.toString()} }'}
    ) async {
    final response = await baseDio
        .$methodType(subUrl: "$subUrl",
         ${dataMap.isEmpty ? "" : "data : {$dataMap},"}
         ${queryMapData.isEmpty ? "" : "queryParameters : {$queryMapData},"}
        ${methodType == "get" ? "model: dynamic" : ""}
        );

    return response;
  }

''';

  print(
    "The Request ${request.name} of type: ${request.request?.method} Generated Successfully",
  );

  return postString;
}
