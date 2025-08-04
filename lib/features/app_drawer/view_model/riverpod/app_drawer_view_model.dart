import '../../model/app_drawer_model.dart';
import '../state/app_drawer_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_drawer_view_model.g.dart';

@riverpod
class AppDrawerViewModel extends _$AppDrawerViewModel {
  @override
  AppDrawerState build() => AppDrawerState(
      drawerElements: AppDrawerModel.instance.getAppDrawerElement(),
      selectedIndex: 0);
}
