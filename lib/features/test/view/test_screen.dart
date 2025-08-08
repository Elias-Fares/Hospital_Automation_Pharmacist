
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestScreen extends ConsumerStatefulWidget {
  const TestScreen({super.key});
  static const routeName = "/test_screen";

  @override
  ConsumerState<TestScreen> createState() => _TestScreenState();
  }

  class _TestScreenState extends ConsumerState<TestScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

