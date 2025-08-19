import 'dart:math';

import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/entities/med_entity.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'update_price_state.dart';
part 'update_price_view_model.g.dart';

@riverpod
class UpdatePriceViewModel extends _$UpdatePriceViewModel {
  @override
  UpdatePriceState build() => UpdatePriceState(selectedMeds: []);

  void addMedicine(MedEntity entity) {
    state = state.copyWith(selectedMeds: [...state.selectedMeds, entity]);
  }

  void removeMedicineId(
    MedEntity entity) {
    final updatedList =
        state.selectedMeds.where((element) => element != entity).toList();
    state = state.copyWith(selectedMeds: updatedList);
  }

  void handleOnMedTap({required MedEntity entity}) {
    if (state.selectedMeds.contains(entity)) {
      removeMedicineId(entity);
    } else {
      addMedicine(entity);
    }
  }

    final _repository = getIt<Repository>();

  Future<void> getMedicines({String name = ""}) async {
    state = state.copyWith(medicinesResponse: AsyncValue.loading());
    final response = await _repository.searchForMedicine(name: name);

    if (response is DataSuccess) {
      state = state.copyWith(medicinesResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        medicinesResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

  
}
