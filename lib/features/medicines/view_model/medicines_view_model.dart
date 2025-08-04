import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'medicines_state.dart';
part 'medicines_view_model.g.dart';

@riverpod
class MedicinesViewModel extends _$MedicinesViewModel {
  @override
  MedicinesState build() => MedicinesState();

}

