import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dispense_state.dart';
part 'dispense_view_model.g.dart';

@riverpod
class DispenseViewModel extends _$DispenseViewModel {
  @override
  DispenseState build() => DispenseState();

}

