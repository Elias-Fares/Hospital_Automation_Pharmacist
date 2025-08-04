// this script add services folder
// ignore_for_file: avoid_print

import 'dart:io';
import 'tools_helper.dart';

void main(List<String> args) async {

  const servicesPath = '${ToolsHelper.externalPath}/services';
  Directory loginDir = Directory(servicesPath);

  final servicesDirectory = Directory("lib/services");
  await ToolsHelper.createDirectoryIfNotExists(servicesDirectory);

  await ToolsHelper.copyFolder(source: loginDir, destination: servicesDirectory);

  print(ToolsHelper.reset);
}
