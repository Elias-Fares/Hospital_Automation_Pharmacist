import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/configuration/res.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/main_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/features/add_new_medicine/view/add_new_medicine_screen.dart';
import 'package:medicare_pharmacy/features/app_drawer/view/app_drawer_screen.dart';
import 'package:medicare_pharmacy/features/dispense/view/dispense_screen.dart';
import 'package:medicare_pharmacy/features/main/view_model/main_view_model.dart';
import 'package:medicare_pharmacy/features/medicines/view/medicines_screen.dart';
import 'package:medicare_pharmacy/features/scanner/view/scanner_screen.dart';

final GlobalKey<ScaffoldState> mainScreenScaffoldKey =
    GlobalKey<ScaffoldState>();

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});
  static const routeName = "/main_screen";

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final List<Widget> _screens = [
    ScannerScreen(),
    DispenseScreen(),
    MedicinesScreen(),
  ];

  Widget _navigationIcon({required String imgPath, required bool isSelected}) {
    return GeneralImageAssets(
      path: imgPath,
      boxFit: BoxFit.contain,
      width: 18,
      height: 18,
      color:
          isSelected
              ? AppColors.onPrimaryContainerBlue
              : AppColors.onSurfaceVariant,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mainState = ref.watch(mainViewModelProvider);
    return Scaffold(
      key: mainScreenScaffoldKey,
      body: _screens.elementAt(mainState.selectedIndex),
      drawer: AppDrawerScreen(mainScreenKey: mainScreenScaffoldKey),

      appBar: MainAppBar(
        openDrawer: () async {
          Scaffold.of(context).openDrawer();
          // final tolken = await FirebaseMessaging.instance.getToken();
          // debugPrint("token ${tolken ?? ""}");
        },
      ),
      floatingActionButton:
          mainState.selectedIndex == 2
              ? FloatingActionButton(
                onPressed: () {
                  context.push(AddNewMedicineScreen.routeName);
                },
                shape: CircleBorder(),
                elevation: 2,

                child: Icon(Icons.add),
              )
              : null,

      bottomNavigationBar: NavigationBar(
        selectedIndex: mainState.selectedIndex,
        onDestinationSelected: (index) {
          ref.read(mainViewModelProvider.notifier).setIndex(index);
        },
        height: 70,
        backgroundColor: AppColors.surfaceContainerHigh,
        indicatorColor: AppColors.primaryContainer,
        destinations: [
          NavigationDestination(
            selectedIcon: _navigationIcon(
              imgPath: Res.appointmentIcon,
              isSelected: true,
            ),
            icon: _navigationIcon(
              imgPath: Res.appointmentIcon,
              isSelected: false,
            ),
            label: "Scanner",
          ),
          NavigationDestination(
            selectedIcon: _navigationIcon(
              imgPath: Res.prescriptionsIcon,
              isSelected: true,
            ),
            icon: _navigationIcon(
              imgPath: Res.prescriptionsIcon,
              isSelected: false,
            ),
            label: "Dispense",
          ),
          NavigationDestination(
            selectedIcon: _navigationIcon(
              imgPath: Res.drawerMedicineIcon,
              isSelected: true,
            ),
            icon: _navigationIcon(
              imgPath: Res.drawerMedicineIcon,
              isSelected: false,
            ),
            label: "Medicines",
          ),
        ],
      ),
    );
  }
}
