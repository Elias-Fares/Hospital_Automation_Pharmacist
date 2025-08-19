import 'dart:convert';

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
