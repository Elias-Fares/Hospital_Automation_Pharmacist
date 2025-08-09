import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';

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

class PharmacyMedicine {
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
}

class MedicineBatch {
  final int? medicineBatchId;
  final int? quantity;
  final DateTime? expiredDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? pharmacyMedicineId;

  MedicineBatch({
    this.medicineBatchId,
    this.quantity,
    this.expiredDate,
    this.createdAt,
    this.updatedAt,
    this.pharmacyMedicineId,
  });

  MedicineBatch copyWith({
    int? medicineBatchId,
    int? quantity,
    DateTime? expiredDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? pharmacyMedicineId,
  }) => MedicineBatch(
    medicineBatchId: medicineBatchId ?? this.medicineBatchId,
    quantity: quantity ?? this.quantity,
    expiredDate: expiredDate ?? this.expiredDate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    pharmacyMedicineId: pharmacyMedicineId ?? this.pharmacyMedicineId,
  );

  factory MedicineBatch.fromRawJson(String str) =>
      MedicineBatch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicineBatch.fromJson(Map<String, dynamic> json) => MedicineBatch(
    medicineBatchId: json["medicine_batchId"],
    quantity: json["quantity"],
    expiredDate:
        json["expired_date"] == null
            ? null
            : DateTime.parse(json["expired_date"]),
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    pharmacyMedicineId: json["pharmacy_medicine_id"],
  );

  Map<String, dynamic> toJson() => {
    "medicine_batchId": medicineBatchId,
    "quantity": quantity,
    "expired_date":
        "${expiredDate!.year.toString().padLeft(4, '0')}-${expiredDate!.month.toString().padLeft(2, '0')}-${expiredDate!.day.toString().padLeft(2, '0')}",
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "pharmacy_medicine_id": pharmacyMedicineId,
  };
}
