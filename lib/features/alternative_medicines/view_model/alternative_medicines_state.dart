import 'package:medicare_pharmacy/data/models/medicine_with_alts_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AlternativeMedicinesState {
  final AsyncValue<MedicineWithAltsModel>? altsResponse;

  AlternativeMedicinesState({this.altsResponse});

  // copyWith method
  AlternativeMedicinesState copyWith({
    AsyncValue<MedicineWithAltsModel>? altsResponse,
  }) {
    return AlternativeMedicinesState(
      altsResponse: altsResponse ?? this.altsResponse,
    );
  }
}