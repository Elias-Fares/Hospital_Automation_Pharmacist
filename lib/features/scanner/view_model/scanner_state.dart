import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';

class ScannerState {
  final bool isScannerVisible;
  final AsyncValue<MedicineModel>? medicineResponse;

  ScannerState({required this.isScannerVisible, this.medicineResponse});

  ScannerState copyWith({bool? isScannerVisible, AsyncValue<MedicineModel>? medicineResponse}) {
    return ScannerState(
      isScannerVisible: isScannerVisible ?? this.isScannerVisible,
      medicineResponse: medicineResponse ?? this.medicineResponse
    );
  }
}
