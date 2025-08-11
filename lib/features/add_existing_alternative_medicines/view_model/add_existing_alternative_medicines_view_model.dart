import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/enums/attach_status.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:medicare_pharmacy/features/alternative_medicines/view_model/alternative_medicines_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_existing_alternative_medicines_state.dart';
part 'add_existing_alternative_medicines_view_model.g.dart';

@riverpod
class AddExistingAlternativeMedicinesViewModel
    extends _$AddExistingAlternativeMedicinesViewModel {
  @override
  AddExistingAlternativeMedicinesState build() =>
      AddExistingAlternativeMedicinesState();

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

  Future<void> attachMedicine({
    required String? medicineId,
    required String? altMedId,
  }) async {
    if (medicineId == null || altMedId == null) {
      return;
    }

    state = state.copyWith(
      attachResponse: AsyncValue.loading(),
      attachStatuses: {...state.attachStatuses, altMedId: AttachStatus.loading},
    );
    final response = await _repository.addAlternatives(
      altMedId: altMedId,
      medicineId: medicineId,
    );

    if (response is DataSuccess) {
      state = state.copyWith(
        attachResponse: AsyncValue.data(response.data),
        attachStatuses: {
          ...state.attachStatuses,
          altMedId: AttachStatus.attached,
        },
      );

      ref
          .read(alternativeMedicinesViewModelProvider.notifier)
          .getAlternativeMedicines(medId: medicineId);
    } else {
      state = state.copyWith(
        attachResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
        attachStatuses: {
          ...state.attachStatuses,
          altMedId: AttachStatus.notAttached,
        },
      );
    }
  }

  // Future<void> addAlt(int index) async {
  //   state = state.copyWith(
  //     attachStatuses: {...state.attachStatuses, index: AttachStatus.loading},
  //   );

  //   await Future.delayed(Duration(seconds: 5));

  //   state = state.copyWith(
  //     attachStatuses: {...state.attachStatuses, index: AttachStatus.attached},
  //   );
  // }
}
