import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'alternative_medicines_state.dart';
part 'alternative_medicines_view_model.g.dart';

@riverpod
class AlternativeMedicinesViewModel extends _$AlternativeMedicinesViewModel {
  @override
  AlternativeMedicinesState build() => AlternativeMedicinesState();

}

