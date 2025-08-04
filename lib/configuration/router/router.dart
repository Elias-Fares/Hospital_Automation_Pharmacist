import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/add_pharmacy_address_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/add_residential_address_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/login_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/reset_password_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/sign_up_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/upload_profile_image_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/verification_code_screen.dart';
import 'package:medicare_pharmacy/features/dispense/view/dispense_screen.dart';
import 'package:medicare_pharmacy/features/main/view/main_screen.dart';
import 'package:medicare_pharmacy/features/medicines/view/medicines_screen.dart';
import 'package:medicare_pharmacy/features/permission_required/view/permission_required_screen.dart';
import 'package:medicare_pharmacy/features/scanner/view/scanner_screen.dart';
import 'package:medicare_pharmacy/features/successful_verification/view/successful_verification_screen.dart';

import 'my_go_router_observer.dart' show MyGoRouterObserver;

class AppRouter {
  AppRouter._();
  static String initialRoute = MainScreen.routeName;

  static final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "root");

  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: initialRoute,
    observers: [MyGoRouterObserver()],
    routes: [
      GoRoute(
        path: SignupScreen.routeName,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: VerificationCodeScreen.routeName,
        builder: (context, state) => const VerificationCodeScreen(),
      ),
      GoRoute(
        path: AddResidentialAddressScreen.routeName,
        builder: (context, state) => const AddResidentialAddressScreen(),
      ),
      GoRoute(
        path: ResetPasswordScreen.routeName,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: UploadProfileImageScreen.routeName,
        builder: (context, state) => const UploadProfileImageScreen(),
      ),
      GoRoute(
        path: SuccessfulVerificationScreen.routeName,
        builder: (context, state) => const SuccessfulVerificationScreen(),
      ),
      GoRoute(
        path: AddPharmacyAddressScreen.routeName,
        builder: (context, state) => const AddPharmacyAddressScreen(),
      ),
      GoRoute(
        path: PermissionRequiredScreen.routeName,
        builder: (context, state) => const PermissionRequiredScreen(),
      ),
      GoRoute(
        path: ScannerScreen.routeName,
        builder: (context, state) => const ScannerScreen(),
      ),
      GoRoute(
        path: DispenseScreen.routeName,
        builder: (context, state) => const DispenseScreen(),
      ),
      GoRoute(
        path: MedicinesScreen.routeName,
        builder: (context, state) => const MedicinesScreen(),
      ),
      GoRoute(
        path: MainScreen.routeName,
        builder: (context, state) => const MainScreen(),
      ),
    ],
  );
}
