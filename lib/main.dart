import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'configuration/service_locator.dart';
import 'features/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const ProviderScope(child: App()));
}
