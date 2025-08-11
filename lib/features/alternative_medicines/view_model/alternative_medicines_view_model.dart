import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'alternative_medicines_state.dart';
part 'alternative_medicines_view_model.g.dart';

@riverpod
class AlternativeMedicinesViewModel extends _$AlternativeMedicinesViewModel {
  @override
  AlternativeMedicinesState build() =>
      AlternativeMedicinesState(detachLoading: {});

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

  void handleDetach({String? id}) {
    final current = state.altsResponse;

    if (current?.value?.medicine?.alternative == null) return;

    final updatedAlternatives = [
      ...current!.value!.medicine!.alternative!.where(
        (element) => element.id?.toString() != id,
      ),
    ];

    final updatedMedicine = current.value!.medicine!.copyWith(
      alternative: updatedAlternatives,
    );

    final updatedValue = current.value!.copyWith(medicine: updatedMedicine);

    final updatedResponse = AsyncValue.data(updatedValue);

    state = state.copyWith(altsResponse: updatedResponse);
  }

  Future<void> detach({required String? id}) async {
    if (id?.isEmpty ?? true) {
      return;
    }
    state = state.copyWith(
      detachResponse: AsyncValue.loading(),
      detachLoading: {...state.detachLoading, id!: true},
    );

    final response = await _repository.detach(id: id);

    if (response is DataSuccess) {
      state = state.copyWith(
        detachResponse: AsyncValue.data(response.data),
        detachLoading: {...state.detachLoading, id: false},
      );

      handleDetach(id: id);
    } else {
      state = state.copyWith(
        altsResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
        detachLoading: {...state.detachLoading, id: false},
      );
    }
  }

}
