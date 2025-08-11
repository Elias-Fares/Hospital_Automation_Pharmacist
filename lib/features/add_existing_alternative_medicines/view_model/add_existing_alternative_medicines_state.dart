part of 'add_existing_alternative_medicines_view_model.dart';

class AddExistingAlternativeMedicinesState {
  final AsyncValue? attachResponse;
  final AsyncValue<List<MedicineModel>>? medicinesResponse;
  final Map<String, AttachStatus> attachStatuses;

  AddExistingAlternativeMedicinesState({
    this.attachResponse,
    this.medicinesResponse,
    this.attachStatuses = const {},
  });

  AddExistingAlternativeMedicinesState copyWith({
    AsyncValue? attachResponse,
    AsyncValue<List<MedicineModel>>? medicinesResponse,
    Map<String, AttachStatus>? attachStatuses,
  }) => AddExistingAlternativeMedicinesState(
    attachResponse: attachResponse ?? this.attachResponse,
    medicinesResponse: medicinesResponse ?? this.medicinesResponse,
    attachStatuses: attachStatuses ?? this.attachStatuses,
  );
}
