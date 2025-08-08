import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/core/models/medicine_model.dart';

class MedicinesState {
  final AsyncValue<List<MedicineModel>>? medicinesResponse;

  MedicinesState({this.medicinesResponse});

  MedicinesState copyWith({
    AsyncValue<List<MedicineModel>>? medicinesResponse,
  }) {
    return MedicinesState(
      medicinesResponse: medicinesResponse ?? this.medicinesResponse,
    );
  }
}
