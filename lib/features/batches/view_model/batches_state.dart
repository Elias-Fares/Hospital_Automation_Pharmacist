import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/data/models/pharmacy_medicine_model.dart';

class BatchesState {
  final AsyncValue<dynamic>? addBatchResponse;
  final AsyncValue<PharmacyMedicine>? getBatchesResponse;

  BatchesState({this.addBatchResponse, this.getBatchesResponse});

  BatchesState copyWith({
    AsyncValue<dynamic>? addBatchResponse,
    AsyncValue<PharmacyMedicine>? getBatchesResponse,
  }) => BatchesState(
    addBatchResponse: addBatchResponse ?? this.addBatchResponse,
    getBatchesResponse: getBatchesResponse ?? this.getBatchesResponse,
  );
}
