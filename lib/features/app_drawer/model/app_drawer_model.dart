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
      AppDrawerElement(iconPath: Res.drawerProfileIcon, title: "Profile"),
      AppDrawerElement(iconPath: Res.notificationIcon, title: "Notifications"),
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
