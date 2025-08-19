import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';
import 'package:medicare_pharmacy/data/models/pharmacy_medicine_model.dart';

class MedicineModel extends GeneralModel {
  final int? medicinesId;
  final String? name;
  final DateTime? expiredAt;
  final int? pharmaceuticalTiter;
  final String? pharmaceuticalIndications;
  final String? pharmaceuticalComposition;
  final String? companyName;
  final int? price;
  final bool? isAllowedWithoutPrescription;
  final String? barcode;
  final String? medImageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<PharmacyMedicine>? pharmacyMedicines;

  MedicineModel({
    this.medicinesId,
    this.name,
    this.expiredAt,
    this.pharmaceuticalTiter,
    this.pharmaceuticalIndications,
    this.pharmaceuticalComposition,
    this.companyName,
    this.price,
    this.isAllowedWithoutPrescription,
    this.barcode,
    this.medImageUrl,
    this.createdAt,
    this.updatedAt,
    this.pharmacyMedicines,
  });

  MedicineModel copyWith({
    int? medicinesId,
    String? name,
    DateTime? expiredAt,
    int? pharmaceuticalTiter,
    String? pharmaceuticalIndications,
    String? pharmaceuticalComposition,
    String? companyName,
    int? price,
    bool? isAllowedWithoutPrescription,
    String? barcode,
    String? medImageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<PharmacyMedicine>? pharmacyMedicines,
  }) => MedicineModel(
    medicinesId: medicinesId ?? this.medicinesId,
    name: name ?? this.name,
    expiredAt: expiredAt ?? this.expiredAt,
    pharmaceuticalTiter: pharmaceuticalTiter ?? this.pharmaceuticalTiter,
    pharmaceuticalIndications:
        pharmaceuticalIndications ?? this.pharmaceuticalIndications,
    pharmaceuticalComposition:
        pharmaceuticalComposition ?? this.pharmaceuticalComposition,
    companyName: companyName ?? this.companyName,
    price: price ?? this.price,
    isAllowedWithoutPrescription:
        isAllowedWithoutPrescription ?? this.isAllowedWithoutPrescription,
    barcode: barcode ?? this.barcode,
    medImageUrl: medImageUrl ?? this.medImageUrl,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    pharmacyMedicines: pharmacyMedicines ?? this.pharmacyMedicines,
  );

  factory MedicineModel.fromRawJson(String str) =>
      MedicineModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
    medicinesId: json["medicinesId"],
    name: json["name"],
    expiredAt:
        json["expiredAt"] == null ? null : DateTime.parse(json["expiredAt"]),
    pharmaceuticalTiter: json["pharmaceuticalTiter"],
    pharmaceuticalIndications: json["pharmaceuticalIndications"],
    pharmaceuticalComposition: json["pharmaceuticalComposition"],
    companyName: json["company_Name"],
    price: json["price"],
    isAllowedWithoutPrescription: json["isAllowedWithoutPrescription"],
    barcode: json["barcode"],
    medImageUrl: json["medImageUrl"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    pharmacyMedicines:
        json["pharmacy_medicines"] == null
            ? []
            : List<PharmacyMedicine>.from(
              json["pharmacy_medicines"]!.map(
                (x) => PharmacyMedicine.fromJson(x),
              ),
            ),
  );

  Map<String, dynamic> toJson() => {
    "medicinesId": medicinesId,
    "name": name,
    "expiredAt": expiredAt?.toIso8601String(),
    "pharmaceuticalTiter": pharmaceuticalTiter,
    "pharmaceuticalIndications": pharmaceuticalIndications,
    "pharmaceuticalComposition": pharmaceuticalComposition,
    "company_Name": companyName,
    "price": price,
    "isAllowedWithoutPrescription": isAllowedWithoutPrescription,
    "barcode": barcode,
    "medImageUrl": medImageUrl,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "pharmacy_medicines":
        pharmacyMedicines == null
            ? []
            : List<dynamic>.from(pharmacyMedicines!.map((x) => x.toJson())),
  };

  @override
  GeneralModel fromJson(json) {
    return MedicineModel.fromJson(json);
  }
}

