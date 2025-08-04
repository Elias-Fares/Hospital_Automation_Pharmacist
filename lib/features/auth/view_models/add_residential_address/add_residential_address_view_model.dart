import '../../../../configuration/service_locator.dart';
import '../../../../core/base_dio/data_state.dart';

import 'add_residential_address_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_residential_address_view_model.g.dart';

@riverpod
class AddResidentialAddressViewModel extends _$AddResidentialAddressViewModel {
  @override
  AddResidentialAddressState build() =>
      AddResidentialAddressState(agreeCheckBox: false);

  // final _authRepository = getIt<AuthRepository>();

  Future<void> addAddress({
    required String governate,
    required String city,
    required String region,
    required String street,
    required String note,
  }) async {
    // state = state.copyWith(addAddressResponse: const AsyncValue.loading());

    // final response = await _authRepository.addAddress(
    //     governate: governate,
    //     city: city,
    //     region: region,
    //     street: street,
    //     note: note);
    // if (response is DataSuccess) {
    //   state = state.copyWith(addAddressResponse: const AsyncValue.data(null));
    // } else {
    //   state = state.copyWith(
    //       addAddressResponse: AsyncValue.error(
    //           response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
    //           StackTrace.current));
    // }
  }

  void onCheckBoxChanged(bool value) {
    state = state.copyWith(agreeCheckBox: value);
  }
}
