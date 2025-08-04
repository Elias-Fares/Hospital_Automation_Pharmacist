import 'package:medicare_pharmacy/features/notifications/view/notifications_screen.dart';
import 'package:medicare_pharmacy/features/pharmacy_profile/view/pharmacy_profile_screen.dart';

import '../../../configuration/res.dart';

class AppDrawerElement {
  final String iconPath;
  final String title;
  final String? routeName;

  AppDrawerElement({
    required this.iconPath,
    required this.title,
    this.routeName,
  });
}

class AppDrawerModel {
  AppDrawerModel._internal();
  static final AppDrawerModel _instance = AppDrawerModel._internal();

  static AppDrawerModel get instance => _instance;

  List<AppDrawerElement> getAppDrawerElement() {
    return [
      AppDrawerElement(
        iconPath: Res.drawerProfileIcon,
        title: "Profile",
        routeName: PharmacyProfileScreen.routeName,
      ),
      AppDrawerElement(
        iconPath: Res.notificationIcon,
        title: "Notifications",
        routeName: NotificationsScreen.routeName,
      ),
      AppDrawerElement(iconPath: Res.inventoryIcon, title: "Inventory"),
      AppDrawerElement(
        iconPath: Res.prescriptionsIcon,
        title: "Dispensed Prescriptions",
      ),
      AppDrawerElement(iconPath: Res.statsIcon, title: "Statistics"),
      AppDrawerElement(iconPath: Res.ordersIcon, title: "Orders"),
      AppDrawerElement(iconPath: Res.pricesIcon, title: "Bulk Prices Update"),
    ];
  }
}
