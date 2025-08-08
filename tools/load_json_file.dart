import 'dart:convert';
import 'package:flutter/services.dart';

Future<dynamic> loadJsonFile({required String filePath}) async {
  final String jsonString = await rootBundle.loadString(filePath);
  final dynamic fileContent = jsonDecode(jsonString);
  return fileContent;
}
