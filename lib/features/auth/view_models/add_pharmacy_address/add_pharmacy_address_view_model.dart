import 'package:medicare_pharmacy/data/repository.dart';

import '../../../../configuration/service_locator.dart';
import '../../../../core/base_dio/data_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_pharmacy_address_view_model.g.dart';
part 'add_pharmacy_address_state.dart';

@riverpod
class AddPharmacyAddressViewModel extends _$AddPharmacyAddressViewModel {
  @override
  AddPharmacyAddressState build() =>
      AddPharmacyAddressState(agreeCheckBox: false);

  final _repository = getIt<Repository>();

  Future<void> addAddress({
    required String governate,
    required String city,
    required String region,
    required String street,
    required String note,
  }) async {
    state = state.copyWith(addAddressResponse: const AsyncValue.loading());

    final response = await _repository.addAddress(
      addressGovernorate: governate,
      addressCity: city,
      addressRegion: region,
      addressStreet: street,
      addressNote: note,
    );
    if (response is DataSuccess) {
      state = state.copyWith(
        addAddressResponse: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        addAddressResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

  void onCheckBoxChanged(bool value) {
    state = state.copyWith(agreeCheckBox: value);
  }
}
