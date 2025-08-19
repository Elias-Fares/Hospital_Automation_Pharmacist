import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';
import 'package:medicare_pharmacy/data/models/medicine_batch_model.dart';

class PharmacyMedicine extends GeneralModel {
  final int? pharmacyMedicineId;
  final int? lowbound;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? medicineId;
  final int? pharmacyId;
  final List<MedicineBatch>? medicineBatches;

  PharmacyMedicine({
    this.pharmacyMedicineId,
    this.lowbound,
    this.createdAt,
    this.updatedAt,
    this.medicineId,
    this.pharmacyId,
    this.medicineBatches,
  });

  PharmacyMedicine copyWith({
    int? pharmacyMedicineId,
    int? lowbound,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? medicineId,
    int? pharmacyId,
    List<MedicineBatch>? medicineBatches,
  }) => PharmacyMedicine(
    pharmacyMedicineId: pharmacyMedicineId ?? this.pharmacyMedicineId,
    lowbound: lowbound ?? this.lowbound,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    medicineId: medicineId ?? this.medicineId,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    medicineBatches: medicineBatches ?? this.medicineBatches,
  );

  factory PharmacyMedicine.fromRawJson(String str) =>
      PharmacyMedicine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PharmacyMedicine.fromJson(
    Map<String, dynamic> json,
  ) => PharmacyMedicine(
    pharmacyMedicineId: json["pharmacy_medicineId"],
    lowbound: json["lowbound"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    medicineId: json["medicine_id"],
    pharmacyId: json["pharmacy_id"],
    medicineBatches:
        json["medicine_batches"] == null
            ? []
            : List<MedicineBatch>.from(
              json["medicine_batches"]!.map((x) => MedicineBatch.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "pharmacy_medicineId": pharmacyMedicineId,
    "lowbound": lowbound,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "medicine_id": medicineId,
    "pharmacy_id": pharmacyId,
    "medicine_batches":
        medicineBatches == null
            ? []
            : List<dynamic>.from(medicineBatches!.map((x) => x.toJson())),
  };
  
  @override
  GeneralModel fromJson(json) {
    return PharmacyMedicine.fromJson(json);
  }
}

