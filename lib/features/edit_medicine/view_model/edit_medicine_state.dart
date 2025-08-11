import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditMedicineState {
  final AsyncValue? editMedResponse;
  final bool isAllowedWithoutPrescription;
  final String? imagePath;

  EditMedicineState({
    this.editMedResponse,
    this.imagePath,
    required this.isAllowedWithoutPrescription,
  });

  EditMedicineState copyWith({
    AsyncValue? editMedResponse,
    bool? isAllowedWithoutPrescription,
    String? imagePath,
  }) {
    return EditMedicineState(
      editMedResponse: editMedResponse ?? this.editMedResponse,
      isAllowedWithoutPrescription:
          isAllowedWithoutPrescription ?? this.isAllowedWithoutPrescription,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
