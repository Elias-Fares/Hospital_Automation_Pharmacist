// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'tools_helper.dart';

void main(List<String> arguments) async {
  // Empty arguments check
  if (arguments.isEmpty) {
    print('❌ Don\'t forget to provide a feature name');
    exit(1);
  }

  // Get the feature name
  final lowerCaseFeatureName = arguments.first.toLowerCase();
  // Convert feature name to camelCase to use it in the files content creation
  final camelCaseFeatureName = ToolsHelper.camelCase(lowerCaseFeatureName);

  if (!ToolsHelper.isValidFeatureName(lowerCaseFeatureName)) {
    print('❌ The Feature name you provide start with invalid char');
    exit(1);
  }

  // This line creates a Directory object pointing to the path lib/features, It does not create the folder yet — it only creates an object representing the path.
  final featuresDirectory = Directory("lib/features");
  // Check if the directory exists
  await ToolsHelper.createDirectoryIfNotExists(featuresDirectory);

  // Create base deirectory which is the directory of the feature
  final baseDir = Directory('${featuresDirectory.path}/$lowerCaseFeatureName');
  await ToolsHelper.createDirectoryIfNotExists(baseDir);

  // ========================== view section =========================//

  // Create view directory
  final viewDirctory = Directory('${baseDir.path}/view');
  await ToolsHelper.createDirectoryIfNotExists(viewDirctory);

  // create view/widget directory
  final viewWidgetDirctory = Directory('${viewDirctory.path}/widget');
  await ToolsHelper.createDirectoryIfNotExists(viewWidgetDirctory);

  // Create Screen file
  ToolsHelper.createFile(
      path: '${viewDirctory.path}/${lowerCaseFeatureName}_screen.dart',
      content: ToolsHelper.getfeatureScreenContentString(
          caseCamelFeatureName: camelCaseFeatureName,
          lowerCaseFeatureName: lowerCaseFeatureName));

  // =============================================================//

  // ============================== Model ==========================//

  // Create model directory
  // final modelDirectory = Directory('${baseDir.path}/model');
  // await ToolsHelper.createDirectoryIfNotExists(modelDirectory);

  //================================================================//

  //============================== view model ========================//

  // Create view model directory
  final viewModelDirectory = Directory('${baseDir.path}/view_model');
  await ToolsHelper.createDirectoryIfNotExists(viewModelDirectory);

  // Create state directory inside view model dir
  // final viewModelStateDirectory = Directory('${viewModelDirectory.path}/state');
  // await ToolsHelper.createDirectoryIfNotExists(viewModelStateDirectory);

  //Create state file inside view_model/
  await ToolsHelper.createFile(
      path: '${viewModelDirectory.path}/${lowerCaseFeatureName}_state.dart',
      content: ToolsHelper.getViewModelStateContent(camelCaseFeatureName));

  // Create riverpod directory inside view model dir
  // final viewModelRiverpodDirectory =
  //     Directory('${viewModelDirectory.path}/riverpod');
  // await ToolsHelper.createDirectoryIfNotExists(viewModelRiverpodDirectory);

  // Create view model file inside view_model/riverpod/
  await ToolsHelper.createFile(
      path:
          '${viewModelDirectory.path}/${lowerCaseFeatureName}_view_model.dart',
      content: ToolsHelper.getViewModelRiverpodContent(
        featureName: camelCaseFeatureName,
        fileName: '${lowerCaseFeatureName}_view_model',
        stateFileName: '${lowerCaseFeatureName}_state.dart',
      ));

  try {
    // Start the process
    Process process = await Process.start(
      'dart',
      ['run', 'build_runner', 'build'],
      runInShell: true,
    );

    // Listen to stdout and stderr streams
    process.stdout.transform(utf8.decoder).listen((data) {
      print('OUT: $data');
    });

    process.stderr.transform(utf8.decoder).listen((data) {
      print('ERR: $data');
    });

    // Wait for the process to complete
    int exitCode = await process.exitCode;

    if (exitCode == 0) {
      print('Build runner completed successfully!');
    } else {
      print('Build runner failed with exit code: $exitCode');
    }
  } catch (e) {
    print('Error executing build runner: $e');
  }

  print('🎉 Starter widgets are ready!');
}
