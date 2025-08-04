import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../configuration/router/router.dart';
import '../../core/style/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.defaultTheme,
          routerConfig: AppRouter.router,
        
        );
      },
    );
  }
}
