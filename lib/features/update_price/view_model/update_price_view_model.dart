import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'update_price_state.dart';
part 'update_price_view_model.g.dart';

@riverpod
class UpdatePriceViewModel extends _$UpdatePriceViewModel {
  @override
  UpdatePriceState build() => UpdatePriceState(selectedMedsIds: []);

  void addMedicineId(String id) {
    state = state.copyWith(selectedMedsIds: [...state.selectedMedsIds, id]);
  }

  void removeMedicineId(String id) {
    final updatedList =
        state.selectedMedsIds.where((element) => element != id).toList();
    state = state.copyWith(selectedMedsIds: updatedList);
  }

  void handleOnMedTap({required String id}) {
    if (state.selectedMedsIds.contains(id)) {
      removeMedicineId(id);
    } else {
      addMedicineId(id);
    }
  }
}
