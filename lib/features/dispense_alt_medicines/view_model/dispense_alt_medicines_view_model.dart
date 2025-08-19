import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/enums/dispence_status.dart';
import 'package:medicare_pharmacy/data/models/medicine_with_alts_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dispense_alt_medicines_state.dart';
part 'dispense_alt_medicines_view_model.g.dart';

@riverpod
class DispenseAltMedicinesViewModel extends _$DispenseAltMedicinesViewModel {
  @override
  DispenseAltMedicinesState build() => DispenseAltMedicinesState();
  final _repository = getIt<Repository>();

  Future<void> getAlternativeMedicines({required String medId}) async {
    if (medId.isEmpty) {
      return;
    }
    state = state.copyWith(altsResponse: AsyncValue.loading());
    final response = await _repository.medicineAndAlternatives(medId: medId);

    if (response is DataSuccess) {
      state = state.copyWith(altsResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        altsResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

  Future<void> markAsDispenced({
    required String originalMedicine,
    required String alternativeMedicine,
    required int count,
  }) async {
    if (originalMedicine.isEmpty || alternativeMedicine.isEmpty || count <= 0) {
      return;
    }
    state = state.copyWith(
      dispeneseAltRespone: AsyncValue.loading(),
      dispenseState: {
        ...state.dispenseState,
        alternativeMedicine: DispenceStatus.loading,
      },
    );
    final response = await _repository.markedAsBought(
      medicineId: originalMedicine,
      altMedicineId: alternativeMedicine,

      count: count,
    );

    if (response is DataSuccess) {
      state = state.copyWith(
        dispeneseAltRespone: AsyncValue.data(response.data),
        dispenseState: {
          ...state.dispenseState,
          alternativeMedicine: DispenceStatus.dispenced,
        },
      );
    } else {
      state = state.copyWith(
        dispeneseAltRespone: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
        dispenseState: {
          ...state.dispenseState,
          alternativeMedicine: DispenceStatus.notDispenced,
        },
      );
    }
  }
}
