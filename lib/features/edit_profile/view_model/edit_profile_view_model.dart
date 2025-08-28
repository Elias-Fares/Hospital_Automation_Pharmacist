import 'package:medicare_pharmacy/data/repository.dart';
import 'package:medicare_pharmacy/features/pharmacy_profile/view_model/pharmacy_profile_view_model.dart';

import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_view_model.g.dart';

@riverpod
class EditProfileViewModel extends _$EditProfileViewModel {
  @override
  AsyncValue? build() => null;

  final _repository = getIt<Repository>();

  Future<void> editUserProfile({
    required String email,
    required String firstName,
    required String middleName,
    required String lastName,
    required String phoneNumber,
    required String addressGovernate,
    required String addressRegion,
    required String addressCity,
    required String addressStreet,
    required String addressNote,
    required String gender,
  }) async {
    state = const AsyncValue.loading();
    final response = await _repository.editPharmacyProfile(
      email: email,
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      addressGovernate: addressGovernate,
      addressRegion: addressRegion,
      addressCity: addressCity,
      addressStreet: addressStreet,
      addressNote: addressNote,
      gender: gender,
    );

    if (response is DataSuccess) {
      state = AsyncValue.data(response.data);
      await ref
          .read(pharmacyProfileViewModelProvider.notifier)
          .showPharmacyProfile();
    } else {
      state = AsyncValue.error(
        response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
        StackTrace.current,
      );
    }
  }
}
