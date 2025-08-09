import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditMedicineState {
  final AsyncValue? editMedResponse;
  final bool isAllowedWithoutPrescription;

  EditMedicineState({this.editMedResponse,required this.isAllowedWithoutPrescription, });

  EditMedicineState copyWith({AsyncValue? editMedResponse, bool? isAllowedWithoutPrescription}) {
    return EditMedicineState(
      editMedResponse: editMedResponse ?? this.editMedResponse,
      isAllowedWithoutPrescription: isAllowedWithoutPrescription ?? this.isAllowedWithoutPrescription
    );
  }
}
