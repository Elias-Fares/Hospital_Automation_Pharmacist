import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'alternative_medicines_state.dart';
part 'alternative_medicines_view_model.g.dart';

@riverpod
class AlternativeMedicinesViewModel extends _$AlternativeMedicinesViewModel {
  @override
  AlternativeMedicinesState build() => AlternativeMedicinesState();

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
}
