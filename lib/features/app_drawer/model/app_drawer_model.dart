import 'package:medicare_pharmacy/features/inventory/view/inventory_screen.dart';
import 'package:medicare_pharmacy/features/notifications/view/notifications_screen.dart';
import 'package:medicare_pharmacy/features/orders/view/orders_screen.dart';
import 'package:medicare_pharmacy/features/pharmacy_profile/view/pharmacy_profile_screen.dart';
import 'package:medicare_pharmacy/features/statistics/view/statistics_screen.dart';
import 'package:medicare_pharmacy/features/update_price/view/update_price_screen.dart';

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
      AppDrawerElement(
        iconPath: Res.inventoryIcon,
        title: "Inventory",
        routeName: InventoryScreen.routeName,
      ),
      // AppDrawerElement(
      //   iconPath: Res.prescriptionsIcon,
      //   title: "Dispensed Prescriptions",
      // ),
      AppDrawerElement(
        iconPath: Res.statsIcon,
        title: "Statistics",
        routeName: StatisticsScreen.routeName,
      ),
      AppDrawerElement(
        iconPath: Res.ordersIcon,
        title: "Orders",
        routeName: OrdersScreen.routeName,
      ),
      AppDrawerElement(
        iconPath: Res.pricesIcon,
        title: "Bulk Prices Update",
        routeName: UpdatePriceScreen.routeName,
      ),
    ];
  }
}
