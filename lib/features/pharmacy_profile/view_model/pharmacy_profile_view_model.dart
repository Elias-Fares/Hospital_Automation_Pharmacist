import 'package:medicare_pharmacy/data/models/pharmacy_details_model.dart';
import 'package:medicare_pharmacy/data/models/profile_model.dart';
import 'package:medicare_pharmacy/data/repository.dart';

import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pharmacy_profile_state.dart';
part 'pharmacy_profile_view_model.g.dart';

@riverpod
class PharmacyProfileViewModel extends _$PharmacyProfileViewModel {
  @override
  PharmacyProfileState build() => PharmacyProfileState();

  final _repository = getIt<Repository>();

    Future<void> showPharmacyProfile() async {
    state = state.copyWith(pharmacyDetailsResponse: const AsyncValue.loading());

    final response = await _repository.showPhProfile();

    if (response is DataSuccess) {
      state =
          state.copyWith(pharmacyDetailsResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          pharmacyDetailsResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }


}
