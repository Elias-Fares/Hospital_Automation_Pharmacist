import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
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
    } else {
      state = state.copyWith(
        addBatchResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
