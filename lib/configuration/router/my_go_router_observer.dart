import 'package:flutter/material.dart';

class MyGoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('Navigated to: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint('Popped: ${route.settings.name}');
  }
  
}
