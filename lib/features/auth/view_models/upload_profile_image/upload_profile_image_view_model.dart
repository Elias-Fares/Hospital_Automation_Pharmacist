import 'dart:io';

import 'package:image_picker/image_picker.dart';
import '../../../../configuration/service_locator.dart';
import '../../../../core/base_dio/data_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/function/check_storage_permission.dart';
part 'upload_profile_image_view_model.g.dart';

class UploadProfileImageState {
  final AsyncValue? uploadProfileImageResponse;
  final File? selectedImage;

  UploadProfileImageState({
    this.uploadProfileImageResponse,
    this.selectedImage,
  });

  UploadProfileImageState copyWith({
    AsyncValue? uploadProfileImageResponse,
    File? selectedImage,
  }) {
    return UploadProfileImageState(
      uploadProfileImageResponse:
          uploadProfileImageResponse ?? this.uploadProfileImageResponse,
      selectedImage: selectedImage ?? this.selectedImage,
    );
  }
}

@riverpod
class UploadProfileImageViewModel extends _$UploadProfileImageViewModel {
  @override
  UploadProfileImageState build() => UploadProfileImageState();

  // final _authRepository = getIt<AuthRepository>();

  Future<void> selectImageFromGallery() async {
    var permisson = await checkStoragePermisson();

    if (!permisson) return;

    final ImagePicker picker = ImagePicker();
    final XFile? response = await picker.pickImage(source: ImageSource.gallery);

    if (response != null) {
      state = state.copyWith(selectedImage: File(response.path));
    }
  }

  Future<void> uploadProfileImage() async {
    if (state.selectedImage == null) {
      return;
    }
    // state =
    //     state.copyWith(uploadProfileImageResponse: const AsyncValue.loading());

    // final response = await _authRepository.uploadProfileImage(
    //     imagePath: state.selectedImage!.path);
    // if (response is DataSuccess) {
    //   state = state.copyWith(
    //       uploadProfileImageResponse: AsyncValue.data(response.data));
    // } else {
    //   state = state.copyWith(
    //       uploadProfileImageResponse: AsyncValue.error(
    //           response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
    //           StackTrace.current));
    // }
  }
}
