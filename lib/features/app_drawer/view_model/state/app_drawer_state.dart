import '../../model/app_drawer_model.dart';

class AppDrawerState {
  final List<AppDrawerElement> drawerElements;
  final int selectedIndex;

  AppDrawerState({required this.drawerElements, required this.selectedIndex});

  AppDrawerState copyWith({
    int? selectedIndex,
  }) =>
      AppDrawerState(
          drawerElements: drawerElements,
          selectedIndex: selectedIndex ?? this.selectedIndex);
}
