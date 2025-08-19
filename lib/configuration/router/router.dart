import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/constant/extra_keys.dart';
import 'package:medicare_pharmacy/core/models/prescription_medicine_model.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/features/add_existing_alternative_medicines/view/add_existing_alternative_medicines_screen.dart';
import 'package:medicare_pharmacy/features/add_new_medicine/view/add_new_medicine_screen.dart';
import 'package:medicare_pharmacy/features/alternative_medicines/view/alternative_medicines_screen.dart';

import 'package:medicare_pharmacy/features/auth/view/screens/add_pharmacy_address_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/add_residential_address_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/login_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/reset_password_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/sign_up_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/upload_profile_image_screen.dart';
import 'package:medicare_pharmacy/features/auth/view/screens/verification_code_screen.dart';
import 'package:medicare_pharmacy/features/batches/view/batches_screen.dart';
import 'package:medicare_pharmacy/features/dispense/view/dispense_screen.dart';
import 'package:medicare_pharmacy/features/dispense_alt_medicines/view/dispense_alt_medicines_screen.dart';
import 'package:medicare_pharmacy/features/dispense_medicines/view/dispense_medicines_screen.dart';
import 'package:medicare_pharmacy/features/edit_medicine/view/edit_medicine_screen.dart';
import 'package:medicare_pharmacy/features/inventory/view/inventory_screen.dart';
import 'package:medicare_pharmacy/features/main/view/main_screen.dart';
import 'package:medicare_pharmacy/features/medicine_details/view/medicine_details_screen.dart';
import 'package:medicare_pharmacy/features/medicines/view/medicines_screen.dart';
import 'package:medicare_pharmacy/features/notifications/view/notifications_screen.dart';
import 'package:medicare_pharmacy/features/orders/view/orders_screen.dart';
import 'package:medicare_pharmacy/features/permission_required/view/permission_required_screen.dart';
import 'package:medicare_pharmacy/features/pharmacy_profile/view/pharmacy_profile_screen.dart';
import 'package:medicare_pharmacy/features/scanner/view/scanner_screen.dart';
import 'package:medicare_pharmacy/features/specify_sale_amount/view/specify_sale_amount_screen.dart';
import 'package:medicare_pharmacy/features/successful_verification/view/successful_verification_screen.dart';
import 'package:medicare_pharmacy/features/update_price/view/update_price_screen.dart';

import 'my_go_router_observer.dart' show MyGoRouterObserver;

class AppRouter {
  AppRouter._();
  static String initialRoute = MainScreen.routeName;

  static final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "root");

  static final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: initialRoute,
    observers: [MyGoRouterObserver(), routeObserver],
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

        builder: (context, state) {
          return const MedicinesScreen();
        },
      ),
      GoRoute(
        path: MainScreen.routeName,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: MedicineDetailsScreen.routeName,
        builder: (context, state) {
          final med = state.extra as MedicineModel?;
          return MedicineDetailsScreen(med: med);
        },
      ),
      GoRoute(
        path: AlternativeMedicinesScreen.routeName,
        builder: (context, state) {
          final medId = state.extra as String;
          return AlternativeMedicinesScreen(medId: medId);
        },
      ),
      GoRoute(
        path: AddExistingAlternativeMedicinesScreen.routeName,
        builder: (context, state) {
          return AddExistingAlternativeMedicinesScreen();
        },
      ),
      GoRoute(
        path: EditMedicineScreen.routeName,
        builder: (context, state) {
          final med = state.extra as MedicineModel?;
          return EditMedicineScreen(med: med);
        },
      ),
      GoRoute(
        path: BatchesScreen.routeName,
        builder: (context, state) {
          final extraMap = state.extra as Map<String, dynamic>;
          final medId = extraMap[ExtraKeys.medId] as int?;
          // final batches = extraMap[ExtraKeys.batches];
          final pharmacyMedicineId =
              extraMap[ExtraKeys.pharmacyMedicineId] as int?;
          return BatchesScreen(
            medicineId: medId,
            pharmacyMedicineId: pharmacyMedicineId,
          );
        },
      ),
      GoRoute(
        path: PharmacyProfileScreen.routeName,
        builder: (context, state) {
          return PharmacyProfileScreen();
        },
      ),
      GoRoute(
        path: NotificationsScreen.routeName,
        builder: (context, state) {
          return NotificationsScreen();
        },
      ),
      GoRoute(
        path: UpdatePriceScreen.routeName,
        builder: (context, state) {
          return UpdatePriceScreen();
        },
      ),
      GoRoute(
        path: DispenseMedicinesScreen.routeName,
        builder: (context, state) {
          final medicines = state.extra as List<PrescriptionMedicine>?;
          return DispenseMedicinesScreen(medicines: medicines);
        },
      ),
      GoRoute(
        path: DispenseAltMedicinesScreen.routeName,
        builder: (context, state) {
          final extraMap = state.extra as Map<String, dynamic>;
          final medId = extraMap[ExtraKeys.medId] as int?;
          final prescriptionMedicineId =
              extraMap[ExtraKeys.prescriptionMedicineId] as int?;
          return DispenseAltMedicinesScreen(
            medId: medId,
            prescriptionMedicineId: prescriptionMedicineId,
          );
        },
      ),
      GoRoute(
        path: OrdersScreen.routeName,
        builder: (context, state) {
          return OrdersScreen();
        },
      ),
      GoRoute(
        path: InventoryScreen.routeName,
        builder: (context, state) {
          return InventoryScreen();
        },
      ),
      GoRoute(
        path: SpecifySaleAmountScreen.routeName,
        builder: (context, state) {
          return SpecifySaleAmountScreen();
        },
      ),
      GoRoute(
        path: AddNewMedicineScreen.routeName,
        builder: (context, state) {
          return AddNewMedicineScreen();
        },
      ),
    ],
  );
}
