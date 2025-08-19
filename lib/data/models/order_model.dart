import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';

class OrderModel extends GeneralModel {
  final int? medicinesOrderId;
  final int? count;
  final int? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? medicineId;
  final int? pharmacyId;
  final Medicine? medicine;

  OrderModel({
    this.medicinesOrderId,
    this.count,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.medicineId,
    this.pharmacyId,
    this.medicine,
  });

  OrderModel copyWith({
    int? medicinesOrderId,
    int? count,
    int? price,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? medicineId,
    int? pharmacyId,
    Medicine? medicine,
  }) => OrderModel(
    medicinesOrderId: medicinesOrderId ?? this.medicinesOrderId,
    count: count ?? this.count,
    price: price ?? this.price,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    medicineId: medicineId ?? this.medicineId,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    medicine: medicine ?? this.medicine,
  );

  factory OrderModel.fromRawJson(String str) =>
      OrderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    medicinesOrderId: json["medicines_orderId"],
    count: json["count"],
    price: json["Price"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    medicineId: json["medicine_id"],
    pharmacyId: json["pharmacy_id"],
    medicine:
        json["medicine"] == null ? null : Medicine.fromJson(json["medicine"]),
  );

  Map<String, dynamic> toJson() => {
    "medicines_orderId": medicinesOrderId,
    "count": count,
    "Price": price,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "medicine_id": medicineId,
    "pharmacy_id": pharmacyId,
    "medicine": medicine?.toJson(),
  };

  @override
  GeneralModel fromJson(json) {
    return OrderModel.fromJson(json);
  }
}

class Medicine {
  final int? medicinesId;
  final String? name;
  final String? medImageUrl;

  Medicine({this.medicinesId, this.name, this.medImageUrl});

  Medicine copyWith({int? medicinesId, String? name, String? medImageUrl}) =>
      Medicine(
        medicinesId: medicinesId ?? this.medicinesId,
        name: name ?? this.name,
        medImageUrl: medImageUrl ?? this.medImageUrl,
      );

  factory Medicine.fromRawJson(String str) =>
      Medicine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    medicinesId: json["medicinesId"],
    name: json["name"],
    medImageUrl: json["medImageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "medicinesId": medicinesId,
    "name": name,
    "medImageUrl": medImageUrl,
  };
}
