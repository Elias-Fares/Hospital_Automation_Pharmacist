import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';

class MedicineWithAltsModel extends GeneralModel {
  final int? pharmacyMedicineId;
  final int? lowbound;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? medicineId;
  final int? pharmacyId;
  final Medicine? medicine;
  final List<dynamic>? medicineBatches;

  MedicineWithAltsModel({
    this.pharmacyMedicineId,
    this.lowbound,
    this.createdAt,
    this.updatedAt,
    this.medicineId,
    this.pharmacyId,
    this.medicine,
    this.medicineBatches,
  });

  MedicineWithAltsModel copyWith({
    int? pharmacyMedicineId,
    int? lowbound,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? medicineId,
    int? pharmacyId,
    Medicine? medicine,
    List<dynamic>? medicineBatches,
  }) => MedicineWithAltsModel(
    pharmacyMedicineId: pharmacyMedicineId ?? this.pharmacyMedicineId,
    lowbound: lowbound ?? this.lowbound,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    medicineId: medicineId ?? this.medicineId,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    medicine: medicine ?? this.medicine,
    medicineBatches: medicineBatches ?? this.medicineBatches,
  );

  factory MedicineWithAltsModel.fromRawJson(String str) =>
      MedicineWithAltsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicineWithAltsModel.fromJson(
    Map<String, dynamic> json,
  ) => MedicineWithAltsModel(
    pharmacyMedicineId: json["pharmacy_medicineId"],
    lowbound: json["lowbound"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    medicineId: json["medicine_id"],
    pharmacyId: json["pharmacy_id"],
    medicine:
        json["medicine"] == null ? null : Medicine.fromJson(json["medicine"]),
    medicineBatches:
        json["medicine_batches"] == null
            ? []
            : List<dynamic>.from(json["medicine_batches"]!.map((x) => x)),
  );

  @override
  Map<String, dynamic> toJson() => {
    "pharmacy_medicineId": pharmacyMedicineId,
    "lowbound": lowbound,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "medicine_id": medicineId,
    "pharmacy_id": pharmacyId,
    "medicine": medicine?.toJson(),
    "medicine_batches":
        medicineBatches == null
            ? []
            : List<dynamic>.from(medicineBatches!.map((x) => x)),
  };

  @override
  GeneralModel fromJson(json) {
    return MedicineWithAltsModel.fromJson(json);
  }
}

class Alternative {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? alternativeId;
  final int? primaryId;
  final MedicineModel? medicine;

  Alternative({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.alternativeId,
    this.primaryId,
    this.medicine,
  });

  Alternative copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? alternativeId,
    int? primaryId,
    MedicineModel? medicine,
  }) => Alternative(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    alternativeId: alternativeId ?? this.alternativeId,
    primaryId: primaryId ?? this.primaryId,
    medicine: medicine ?? this.medicine,
  );

  factory Alternative.fromRawJson(String str) =>
      Alternative.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Alternative.fromJson(Map<String, dynamic> json) => Alternative(
    id: json["id"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    alternativeId: json["alternative_id"],
    primaryId: json["primary_id"],
    medicine:
        json["medicine"] == null
            ? null
            : MedicineModel.fromJson(json["medicine"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "alternative_id": alternativeId,
    "primary_id": primaryId,
    "medicine": medicine?.toJson(),
  };
}

class Medicine {
  final int? medicinesId;
  final String? name;
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
  final List<Alternative>? alternative;

  Medicine({
    this.medicinesId,
    this.name,
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
    this.alternative,
  });

  Medicine copyWith({
    int? medicinesId,
    String? name,
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
    List<Alternative>? alternative,
  }) => Medicine(
    medicinesId: medicinesId ?? this.medicinesId,
    name: name ?? this.name,
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
    alternative: alternative ?? this.alternative,
  );

  factory Medicine.fromRawJson(String str) =>
      Medicine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    medicinesId: json["medicinesId"],
    name: json["name"],
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
    alternative:
        json["alternative"] == null
            ? []
            : List<Alternative>.from(
              json["alternative"]!.map((x) => Alternative.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "medicinesId": medicinesId,
    "name": name,
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
    "alternative":
        alternative == null
            ? []
            : List<dynamic>.from(alternative!.map((x) => x.toJson())),
  };
}
