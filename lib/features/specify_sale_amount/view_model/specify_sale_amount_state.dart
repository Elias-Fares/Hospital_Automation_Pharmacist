import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/core/entities/medicine_sale.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';

class SpecifySaleAmountState {
  final AsyncValue? sellingResponse;
  final List<MedicineOrder> medicines;
  final AsyncValue<MedicineModel>? fetchMedicineResponse;
  final int totalPrice;

  SpecifySaleAmountState({
    this.sellingResponse,
    required this.medicines,
    this.fetchMedicineResponse,
    required this.totalPrice,
  });

  SpecifySaleAmountState copyWith({
    AsyncValue? sellingResponse,
    List<MedicineOrder>? medicines,
    AsyncValue<MedicineModel>? fetchMedicineResponse,
    int? totalPrice,
  }) {
    return SpecifySaleAmountState(
      sellingResponse: sellingResponse ?? this.sellingResponse,
      medicines: medicines ?? this.medicines,
      fetchMedicineResponse:
          fetchMedicineResponse ?? this.fetchMedicineResponse,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
