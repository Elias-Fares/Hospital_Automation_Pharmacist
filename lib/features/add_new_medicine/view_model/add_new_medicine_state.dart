part of 'add_new_medicine_view_model.dart';

class AddNewMedicineState {
  final AsyncValue? addMedResponse;
  final bool isAllowedWithoutPrescription;
  final String? imagePath;

  AddNewMedicineState({
     this.addMedResponse,
    required this.isAllowedWithoutPrescription,
     this.imagePath,
  });

  AddNewMedicineState copyWith({
    AsyncValue? addMedResponse,
    bool? isAllowedWithoutPrescription,
    String? imagePath,
  }) {
    return AddNewMedicineState(
      addMedResponse: addMedResponse ?? this.addMedResponse,
      isAllowedWithoutPrescription:
          isAllowedWithoutPrescription ?? this.isAllowedWithoutPrescription,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
