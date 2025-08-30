import 'package:equatable/equatable.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';

class MedicineOrder {
  final MedicineModel medicineModel;
  final int quantity;

  MedicineOrder({required this.medicineModel, required this.quantity});

  MedicineOrder copyWith({MedicineModel? medicineModel, int? quantity}) =>
      MedicineOrder(
        medicineModel: medicineModel ?? this.medicineModel,
        quantity: quantity ?? this.quantity,
      );
}
