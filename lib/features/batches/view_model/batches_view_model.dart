import 'package:flutter/material.dart';
import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/core/enums/batch_status.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'batches_state.dart';
part 'batches_view_model.g.dart';

@riverpod
class BatchesViewModel extends _$BatchesViewModel {
  @override
  BatchesState build() => BatchesState();

  final _repository = getIt<Repository>();

  Future<void> addBatch({
    required String quantity,
    required String expiredDate,
    required String? medId,
    required String? pharmacyMedicineId,
  }) async {
    if (medId == null) {
      return;
    }
    state = state.copyWith(addBatchResponse: AsyncValue.loading());
    final response = await _repository.addBatch(
      expiredDate: expiredDate,
      medId: medId,
      quantity: quantity,
    );

    if (response is DataSuccess) {
      state = state.copyWith(addBatchResponse: AsyncValue.data(response.data));
      getMedicineBatches(pharmacyMedicineId: pharmacyMedicineId);
    } else {
      state = state.copyWith(
        addBatchResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

  Future<void> getMedicineBatches({required String? pharmacyMedicineId}) async {
    if (pharmacyMedicineId == null) {
      return;
    }
    state = state.copyWith(getBatchesResponse: AsyncValue.loading());
    final response = await _repository.getMedicineBatches(
      id: pharmacyMedicineId,
    );

    if (response is DataSuccess) {
      state = state.copyWith(
        getBatchesResponse: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        getBatchesResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

BatchStatus getBatchStatus({required DateTime? batchDate}) {
  if (batchDate == null) {
    return BatchStatus.expired;
  }

  final currentDate = DateTime.now();
  final daysLeft = batchDate.difference(currentDate).inDays;

  if (daysLeft < 0) {
    // Already expired
    return BatchStatus.expired;
  } else if (daysLeft <= 90) {
    // Expiring soon (within 90 days)
    return BatchStatus.warning;
  } else {
    // Safe (more than 90 days left)
    return BatchStatus.safe;
  }
}

}
