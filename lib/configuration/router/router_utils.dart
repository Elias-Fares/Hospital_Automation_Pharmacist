import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterUtils {
  RouterUtils._();
  static String nestedRoute(
    String baseRoute,
    String route1, [
    String? route2,
    String? route3,
    String? route4,
    String? route5,
  ]) {
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.write(baseRoute);
    // stringBuffer.write("/");
    stringBuffer.write(route1);

    if (route2 != null) {
      // stringBuffer.write("/");
      stringBuffer.write(route2);
    }
    if (route3 != null) {
      // stringBuffer.write("/");
      stringBuffer.write(route3);
    }
    if (route4 != null) {
      // stringBuffer.write("/");
      stringBuffer.write(route4);
    }
    if (route5 != null) {
      // stringBuffer.write("/");
      stringBuffer.write(route5);
    }

    debugPrint("The route is : ${stringBuffer.toString()}");
    return stringBuffer.toString();
  }

  static String getNestedRoute(BuildContext context,
      {required String routeName}) {
    final currentLocation = GoRouter.of(context).state.uri.path;

    return "$currentLocation$routeName";
  }

  static void debugGoRouterStack(BuildContext context) {
    final router = GoRouter.of(context);
    final delegate = router.routerDelegate;

    final location = delegate.currentConfiguration.uri.toString();
    final matches = delegate.currentConfiguration.matches;

    print('--- FULL NAVIGATION STACK ---');
    print('Current URL: $location');

    for (final match in matches) {
      final route = match.route;

      if (route is StatefulShellRoute) {
        print('StatefulShellRoute (Bottom Navigation)');

        // Each branch is a separate navigator
        for (var i = 0; i < route.branches.length; i++) {
          final branch = route.branches[i];
          print(' Branch $i stack:');

          // Each branch has its own navigatorKey
          final navigatorKey = branch.navigatorKey;
          final navigatorState = navigatorKey.currentState;

          if (navigatorState != null) {
            final pages = navigatorState.widget.pages;
            for (final page in pages) {
              print('   - ${page.name ?? page.runtimeType}');
            }
          } else {
            print('   (Navigator not mounted yet)');
          }
        }
      } else if (route is GoRoute) {
        print('GoRoute: ${route.path}');
      } else if (route is ShellRoute) {
        print('ShellRoute (Non-stateful)');
      } else {
        print('${route.runtimeType}');
      }
    }

    print('--- END OF STACK ---');
  }
}
