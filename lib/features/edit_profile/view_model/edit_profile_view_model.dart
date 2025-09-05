import 'package:image_picker/image_picker.dart';
import 'package:medicare_pharmacy/core/function/check_storage_permission.dart';
import 'package:medicare_pharmacy/data/repository.dart';
import 'package:medicare_pharmacy/features/pharmacy_profile/view_model/pharmacy_profile_view_model.dart';

import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_view_model.g.dart';
part 'edit_profile_state.dart';

@riverpod
class EditProfileViewModel extends _$EditProfileViewModel {
  @override
  EditProfileState build() => EditProfileState();

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
    state = state.copyWith(editProfileResponse: const AsyncValue.loading());
    final response = await _repository.editPharmacyProfile(
      imagePath: state.selectedImagePath,
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
      state = state.copyWith(
        editProfileResponse: AsyncValue.data(response.data),
      );
      await ref
          .read(pharmacyProfileViewModelProvider.notifier)
          .showPharmacyProfile();
    } else {
      state = state.copyWith(
        editProfileResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

  Future<void> selectImageFromGallery() async {
    final hasPermission = await checkStoragePermisson();
    if (!hasPermission) return;

    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);

    if (result != null && result.path.isNotEmpty) {
      state = state.copyWith(selectedImagePath: result.path);
    }
  }
}
