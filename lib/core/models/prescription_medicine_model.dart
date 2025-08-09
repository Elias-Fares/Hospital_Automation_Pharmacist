import 'dart:convert';

import '../../data/models/medicine_model.dart';

class PrescriptionMedicine {
  final int? prescriptionMedicinesId;
  final String? howToTake;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? pharmacyId;
  final int? medicinesId;
  final int? prescriptionId;
  final MedicineModel? medicine;

  PrescriptionMedicine({
    this.prescriptionMedicinesId,
    this.howToTake,
    this.createdAt,
    this.updatedAt,
    this.pharmacyId,
    this.medicinesId,
    this.prescriptionId,
    this.medicine,
  });

  PrescriptionMedicine copyWith({
    int? prescriptionMedicinesId,
    String? howToTake,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? pharmacyId,
    int? medicinesId,
    int? prescriptionId,
    MedicineModel? medicine,
  }) =>
      PrescriptionMedicine(
        prescriptionMedicinesId:
            prescriptionMedicinesId ?? this.prescriptionMedicinesId,
        howToTake: howToTake ?? this.howToTake,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pharmacyId: pharmacyId ?? this.pharmacyId,
        medicinesId: medicinesId ?? this.medicinesId,
        prescriptionId: prescriptionId ?? this.prescriptionId,
        medicine: medicine ?? this.medicine,
      );

  factory PrescriptionMedicine.fromRawJson(String str) =>
      PrescriptionMedicine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrescriptionMedicine.fromJson(Map<String, dynamic> json) =>
      PrescriptionMedicine(
        prescriptionMedicinesId: json["prescription_medicinesId"],
        howToTake: json["howToTake"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        pharmacyId: json["pharmacy_id"],
        medicinesId: json["medicines_id"],
        prescriptionId: json["prescription_id"],
        medicine: json["medicine"] == null
            ? null
            : MedicineModel.fromJson(json["medicine"]),
      );

  Map<String, dynamic> toJson() => {
        "prescription_medicinesId": prescriptionMedicinesId,
        "howToTake": howToTake,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "pharmacy_id": pharmacyId,
        "medicines_id": medicinesId,
        "prescription_id": prescriptionId,
        "medicine": medicine?.toJson(),
      };
}

