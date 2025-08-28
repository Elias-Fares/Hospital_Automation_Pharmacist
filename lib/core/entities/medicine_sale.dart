import 'package:equatable/equatable.dart';

class MedicineSale {
  String medicineId;
  double unitPrice;
  int quantity;

  MedicineSale({
    required this.medicineId,
    required this.unitPrice,
    required this.quantity,
  });

  @override
  String toString() {
    return "( $medicineId , $unitPrice , $quantity )";
  }
}
