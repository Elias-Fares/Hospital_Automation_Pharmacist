import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'test_state.dart';
part 'test_view_model.g.dart';

@riverpod
class TestViewModel extends _$TestViewModel {
  @override
  TestState build() => TestState();

}

