import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dispense_medicines_state.dart';
part 'dispense_medicines_view_model.g.dart';

@riverpod
class DispenseMedicinesViewModel extends _$DispenseMedicinesViewModel {
  @override
  DispenseMedicinesState build() => DispenseMedicinesState();

}

