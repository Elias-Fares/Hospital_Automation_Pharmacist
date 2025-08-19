part of'update_price_view_model.dart';

class UpdatePriceState {
  final List<MedEntity> selectedMeds;
    final AsyncValue<List<MedicineModel>>? medicinesResponse;
  


  UpdatePriceState({required this.selectedMeds, this.medicinesResponse});

  UpdatePriceState copyWith({List<MedEntity>? selectedMeds,  AsyncValue<List<MedicineModel>>? medicinesResponse}) {
    return UpdatePriceState(
      selectedMeds: selectedMeds ?? this.selectedMeds,
      medicinesResponse: medicinesResponse ?? this.medicinesResponse
    );
  }
}
