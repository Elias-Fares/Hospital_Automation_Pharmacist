import 'dart:convert';

import '../base_dio/general_model.dart';
import 'user.dart';

class MedicineModel extends GeneralModel {
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
  final List<PharmacyMedicine>? pharmacyMedicines;

  MedicineModel({
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
    this.pharmacyMedicines,
  });

  MedicineModel copyWith({
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
    List<PharmacyMedicine>? pharmacyMedicines,
  }) =>
      MedicineModel(
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
        pharmacyMedicines: pharmacyMedicines ?? this.pharmacyMedicines,
      );

  factory MedicineModel.fromRawJson(String str) =>
      MedicineModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        pharmacyMedicines: json["pharmacy_medicines"] == null
            ? []
            : List<PharmacyMedicine>.from(json["pharmacy_medicines"]!
                .map((x) => PharmacyMedicine.fromJson(x))),
      );

  @override
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
        "pharmacy_medicines": pharmacyMedicines == null
            ? []
            : List<dynamic>.from(pharmacyMedicines!.map((x) => x.toJson())),
      };

  @override
  GeneralModel fromJson(json) {
    return MedicineModel.fromJson(json);
  }
}

class PharmacyMedicine {
  final int? pharmacyId;
  final Pharmacy? pharmacy;

  PharmacyMedicine({
    this.pharmacyId,
    this.pharmacy,
  });

  PharmacyMedicine copyWith({
    int? pharmacyId,
    Pharmacy? pharmacy,
  }) =>
      PharmacyMedicine(
        pharmacyId: pharmacyId ?? this.pharmacyId,
        pharmacy: pharmacy ?? this.pharmacy,
      );

  factory PharmacyMedicine.fromRawJson(String str) =>
      PharmacyMedicine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PharmacyMedicine.fromJson(Map<String, dynamic> json) =>
      PharmacyMedicine(
        pharmacyId: json["pharmacy_id"],
        pharmacy: json["pharmacy"] == null
            ? null
            : Pharmacy.fromJson(json["pharmacy"]),
      );

  Map<String, dynamic> toJson() => {
        "pharmacy_id": pharmacyId,
        "pharmacy": pharmacy?.toJson(),
      };
}

class Pharmacy {
  final int? pharmacyId;
  final String? phName;
  final User? user;

  Pharmacy({
    this.pharmacyId,
    this.phName,
    this.user,
  });

  Pharmacy copyWith({
    int? pharmacyId,
    String? phName,
    User? user,
  }) =>
      Pharmacy(
        pharmacyId: pharmacyId ?? this.pharmacyId,
        phName: phName ?? this.phName,
        user: user ?? this.user,
      );

  factory Pharmacy.fromRawJson(String str) =>
      Pharmacy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
        pharmacyId: json["pharmacyId"],
        phName: json["ph_name"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "pharmacyId": pharmacyId,
        "ph_name": phName,
        "user": user?.toJson(),
      };
}
