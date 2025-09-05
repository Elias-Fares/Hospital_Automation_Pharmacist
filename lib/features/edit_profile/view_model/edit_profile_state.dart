part of 'edit_profile_view_model.dart';

class EditProfileState {
  final AsyncValue? editProfileResponse;
  final String? selectedImagePath;

  EditProfileState({
    this.editProfileResponse,
    this.selectedImagePath,
  });

  EditProfileState copyWith({
    AsyncValue? editProfileResponse,
    String? selectedImagePath,
  }) {
    return EditProfileState(
      editProfileResponse: editProfileResponse ?? this.editProfileResponse,
      selectedImagePath: selectedImagePath ?? this.selectedImagePath,
    );
  }
}
