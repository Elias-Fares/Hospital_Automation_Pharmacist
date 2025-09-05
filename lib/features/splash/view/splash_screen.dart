import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/features/splash/view_model/splash_view_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  static const routeName = "/splash_screen";

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        ref.read(splashViewModelProvider.notifier).redirection(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final splashstate = ref.watch(splashViewModelProvider);
    return Scaffold(body: Center(child: Text("Medicare")));
  }
}
