// ignore_for_file: avoid_print

import 'dart:io';
import 'package:path/path.dart' as p;

class ToolsHelper {
  ToolsHelper._();

  static const String externalPath = 'D:/flutter_repo';
  static const String black = '\x1B[30m';
  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String blue = '\x1B[34m';
  static const String magenta = '\x1B[35m';
  static const String cyan = '\x1B[36m';
  static const String white = '\x1B[37m';
  static const String reset = '\x1B[0m';

  static String getfeatureScreenContentString({
    required String caseCamelFeatureName,
    required String lowerCaseFeatureName,
  }) {
    return '''

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ${caseCamelFeatureName}Screen extends ConsumerStatefulWidget {
  const ${caseCamelFeatureName}Screen({super.key});
  static const routeName = "/${lowerCaseFeatureName}_screen";

  @override
  ConsumerState<${caseCamelFeatureName}Screen> createState() => _${caseCamelFeatureName}ScreenState();
  }

  class _${caseCamelFeatureName}ScreenState extends ConsumerState<${caseCamelFeatureName}Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

''';
  }

  static String getViewModelStateContent(String featureName) {
    return '''
class ${featureName}State {

}

''';
  }

  static String getViewModelRiverpodContent({
    required String featureName,
    required String fileName,
    required String stateFileName,
  }) {
    return '''
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '$stateFileName';
part '$fileName.g.dart';

@riverpod
class ${featureName}ViewModel extends _\$${featureName}ViewModel {
  @override
  ${featureName}State build() => ${featureName}State();

}

''';
  }

  static String camelCase(String text) {
    if (text.isEmpty) {
      return '';
    }

    List<String> words = text.toLowerCase().split('_');
    String result = '';

    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      if (word.isNotEmpty) {
        result += word[0].toUpperCase() + word.substring(1);
      }
    }

    return result;
  }

  static String varCamelCase(String text, {String comma = "_"}) {
    if (text.isEmpty) {
      return '';
    }

    List<String> words = text.toLowerCase().split(comma);
    String result = '';

    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      if (word.isNotEmpty) {
        if (i == 0) {
          // result += word[0].toUpperCase() + word.substring(1);
          result = word;
        } else {
          result += word[0].toUpperCase() + word.substring(1);
        }
      }
    }

    return result.replaceAll(" ", "");
  }

  static bool isValidFeatureName(String name) {
    return !RegExp(r'^[0-9*/_\-]').hasMatch(name);
  }

  static Future<void> createDirectoryIfNotExists(Directory dir) async {
    if (!await dir.exists()) {
      await dir.create(recursive: true);
      print("✅ ${dir.path} Directory created successfully");
    }
  }

  static Future<void> createFile({
    required String path,
    required String content,
  }) async {
    final createdFile = File(path);
    if (!await createdFile.exists()) {
      // Add content to created file
      await createdFile.writeAsString(content);
      print('✅ Created: ${createdFile.path}');
    } else {
      print('⚠️ Already exists: ${createdFile.path}');
    }
  }

  static Future<void> createFileV2({
    required String fileName,
    required String folderPath,
    required String fileContent,
  }) async {
    final file = File('$folderPath/$fileName');
    if (!await file.exists()) {
      await file.writeAsString(fileContent);
      print('$blue✅ Created: ${file.path}');
    } else {
      print('$reset⚠️  Already exists: ${file.path}');
    }
  }

  static Future<void> copyFolder({
    required Directory source,
    required Directory destination,
  }) async {
    if (!await source.exists()) {
      print("$red⛔ Source folder does not exist: ${source.path} ⛔");
      print(reset);
      exit(1);
    }
    if (!await destination.exists()) {
      await destination.create(recursive: true);
    }
    await for (var entity in source.list(recursive: false)) {
      if (entity is File) {
        await createFileV2(
          fileName: p.basename(entity.path),
          folderPath: destination.path,
          fileContent: entity.readAsStringSync(),
        );
      } else if (entity is Directory) {
        final newPath = destination.uri.path + p.basename(entity.path);
        final subDir = Directory(newPath);
        await createDirectoryIfNotExists(subDir);

        await copyFolder(source: entity, destination: subDir);
      }
    }
  }

 static String extractPath(String input) {
  final regex = RegExp(r'(?<=\}\})/[^?]+');
  final match = regex.firstMatch(input);
  return match?.group(0) ?? '';
}
}
