part of 'update_price_view_model.dart';

class UpdatePriceState {
  final List<MedEntity> selectedMeds;
  final AsyncValue<List<MedicineModel>>? medicinesResponse;
  final AsyncValue? updatePriceResponse;
  final ParamsValues updateType;

  UpdatePriceState({
    required this.selectedMeds,
    this.medicinesResponse,
    this.updatePriceResponse,
    required this.updateType
  });

  UpdatePriceState copyWith({
    List<MedEntity>? selectedMeds,
    AsyncValue<List<MedicineModel>>? medicinesResponse,
    AsyncValue? updatePriceResponse,
    ParamsValues? updateType
  }) {
    return UpdatePriceState(
      selectedMeds: selectedMeds ?? this.selectedMeds,
      medicinesResponse: medicinesResponse ?? this.medicinesResponse,
      updatePriceResponse: updatePriceResponse ?? this.updatePriceResponse,
      updateType: updateType ?? this.updateType
    );
  }
}
