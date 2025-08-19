part of 'dispense_view_model.dart';

class DispenseState {
  final AsyncValue<PrescriptionModel>? prescriptionResponse;

  DispenseState({this.prescriptionResponse});

  DispenseState copyWith({
    AsyncValue<PrescriptionModel>? prescriptionResponse,
  }) {
    return DispenseState(
      prescriptionResponse: prescriptionResponse ?? this.prescriptionResponse,
    );
  }
}
