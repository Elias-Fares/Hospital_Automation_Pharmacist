import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'main_state.dart';
part 'main_view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  @override
  MainState build() => MainState(selectedIndex: 0);

  void setIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}
