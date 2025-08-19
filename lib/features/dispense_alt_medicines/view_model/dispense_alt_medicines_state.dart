part of 'dispense_alt_medicines_view_model.dart';

class DispenseAltMedicinesState {
  final AsyncValue<MedicineWithAltsModel>? altsResponse;
  final AsyncValue? dispeneseAltRespone;
  final Map<String, DispenceStatus> dispenseState;

  DispenseAltMedicinesState({
    this.altsResponse,
    this.dispeneseAltRespone,
    this.dispenseState = const {},
  });

  DispenseAltMedicinesState copyWith({
    AsyncValue<MedicineWithAltsModel>? altsResponse,
    AsyncValue? dispeneseAltRespone,
    Map<String, DispenceStatus>? dispenseState,
  }) {
    return DispenseAltMedicinesState(
      altsResponse: altsResponse ?? this.altsResponse,
      dispeneseAltRespone: dispeneseAltRespone ?? this.dispeneseAltRespone,
      dispenseState: dispenseState ?? this.dispenseState,
    );
  }
}
