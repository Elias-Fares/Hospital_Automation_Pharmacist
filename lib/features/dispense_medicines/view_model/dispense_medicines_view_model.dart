import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/enums/dispence_status.dart';
import 'package:medicare_pharmacy/data/models/medicine_batch_model.dart';
import 'package:medicare_pharmacy/data/models/pharmacy_medicine_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:medicare_pharmacy/features/dispense/view_model/dispense_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dispense_medicines_state.dart';
part 'dispense_medicines_view_model.g.dart';

@riverpod
class DispenseMedicinesViewModel extends _$DispenseMedicinesViewModel {
  @override
  DispenseMedicinesState build() => DispenseMedicinesState();

  final _repository = getIt<Repository>();

  Future<void> markAsDispenced({required String id, required int count}) async {
    if (id.isEmpty) {
      return;
    }
    state = state.copyWith(
      markAsDispencedResponse: AsyncValue.loading(),
      dispenceStatus: {...state.dispenceStatus, id: DispenceStatus.loading},
    );
    final response = await _repository.markedAsBought(
      medicineId: id,
      count: count,
    );

    if (response is DataSuccess) {
      state = state.copyWith(
        markAsDispencedResponse: AsyncValue.data(response.data),
        dispenceStatus: {...state.dispenceStatus, id: DispenceStatus.dispenced},
      );
    } else {
      state = state.copyWith(
        markAsDispencedResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
        dispenceStatus: {
          ...state.dispenceStatus,
          id: DispenceStatus.notDispenced,
        },
      );
    }
  }

  bool needAlt({required PharmacyMedicine? medicine}) {
    // if the medicine is null return true
    if (medicine == null) {
      return false;
    }

    // if the medicine has no batches or the batches are empty, return true
    if (medicine.medicineBatches == null || medicine.medicineBatches!.isEmpty) {
      return true;
    }

    // get the quantity and low bound of the medicine
    int quantity = 0;
    int lowBound = medicine.lowbound ?? 0;

    // calculate the total quantity of the medicine batches
    for (MedicineBatch batch in medicine.medicineBatches ?? []) {
      quantity += (batch.quantity ?? 0);
    }

    if (quantity + 2 > lowBound) {
      return false;
    } else {
      return true;
    }
  }

  // void markAsDispencedFromAlternatives({
  //   required String id,
  //   required int count,
  //   required String prescriptionMedicineId,
  // }) {
  //   state = state.copyWith(
  //     dispenseState: {
  //       ...state.dispenseState,
  //       id: DispenceStatus.loading,
  //     },
  //   );

  //   ref
  //       .read(dispenseViewModelProvider.notifier)
  //       .markAsDispencedForAlt(id: id, count: count, prescriptionMedicineId: prescriptionMedicineId);
  // }
}
