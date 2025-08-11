import 'package:medicare_pharmacy/data/models/medicine_with_alts_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AlternativeMedicinesState {
  final AsyncValue<MedicineWithAltsModel>? altsResponse;
  final AsyncValue? detachResponse;
  final Map<String, bool> detachLoading;

  AlternativeMedicinesState({
    this.altsResponse,
    this.detachResponse,
    required this.detachLoading,
  });

  // copyWith method
  AlternativeMedicinesState copyWith({
    AsyncValue<MedicineWithAltsModel>? altsResponse,
    AsyncValue? detachResponse,
    Map<String, bool>? detachLoading,
  }) {
    return AlternativeMedicinesState(
      altsResponse: altsResponse ?? this.altsResponse,
      detachResponse: detachResponse ?? this.detachResponse,
      detachLoading: detachLoading ?? this.detachLoading,
    );
  }
}
