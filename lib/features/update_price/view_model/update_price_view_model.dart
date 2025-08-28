import 'dart:math';

import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/entities/med_entity.dart';
import 'package:medicare_pharmacy/core/enums/params_values.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'update_price_state.dart';
part 'update_price_view_model.g.dart';

@riverpod
class UpdatePriceViewModel extends _$UpdatePriceViewModel {
  @override
  UpdatePriceState build() =>
      UpdatePriceState(selectedMeds: [], updateType: ParamsValues.up);

  void addMedicine(MedEntity entity) {
    state = state.copyWith(selectedMeds: [...state.selectedMeds, entity]);
  }

  void removeMedicineId(MedEntity entity) {
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

  void onUpdateTypeChanged(ParamsValues value) {
    state = state.copyWith(updateType: value);
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

  Future<void> updatePrice({required double percentage}) async {
    state = state.copyWith(updatePriceResponse: AsyncValue.loading());
    final response = await _repository.updatePricePercentage(
      medicineIds: state.selectedMeds.map((e) => e.id).toList(),
      percentage: percentage,
      type: state.updateType.name,
    );

    if (response is DataSuccess) {
      state = state.copyWith(
        updatePriceResponse: AsyncValue.data(response.data),
      );

      getMedicines();
    } else {
      state = state.copyWith(
        updatePriceResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
