import 'package:medicare_pharmacy/configuration/service_locator.dart';
import 'package:medicare_pharmacy/core/base_dio/data_state.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'medicine_details_state.dart';
part 'medicine_details_view_model.g.dart';

@riverpod
class MedicineDetailsViewModel extends _$MedicineDetailsViewModel {
  @override
  MedicineDetailsState build() => MedicineDetailsState();
  final _repository = getIt<Repository>();

  Future<void> deleteMedicine({required String medId}) async {
    state = state.copyWith(deleteMedReposne: AsyncValue.loading());
    final response = await _repository.deleteFromMyPharmacy(medId: medId);

    if (response is DataSuccess) {
      state = state.copyWith(deleteMedReposne: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
        deleteMedReposne: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }


}
