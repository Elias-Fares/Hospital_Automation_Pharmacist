import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';
import 'package:medicare_pharmacy/core/models/prescription_medicine_model.dart';
import 'package:medicare_pharmacy/data/models/doctor_model.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';

class PrescriptionModel extends GeneralModel {
  final int? prescriptionsId;
  final String? code;
  final String? note;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? clinicId;
  final int? doctorId;
  final int? patientId;
  final int? childId;
  final DoctorModel? doctorP;
  final List<PrescriptionMedicine>? prescriptionMedicines;

  PrescriptionModel({
    this.prescriptionsId,
    this.code,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.clinicId,
    this.doctorId,
    this.patientId,
    this.childId,
    this.doctorP,
    this.prescriptionMedicines,
  });

  PrescriptionModel copyWith({
    int? prescriptionsId,
    String? code,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? clinicId,
    int? doctorId,
    int? patientId,
    int? childId,
    DoctorModel? doctorP,
    List<PrescriptionMedicine>? prescriptionMedicines,
  }) => PrescriptionModel(
    prescriptionsId: prescriptionsId ?? this.prescriptionsId,
    code: code ?? this.code,
    note: note ?? this.note,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    clinicId: clinicId ?? this.clinicId,
    doctorId: doctorId ?? this.doctorId,
    patientId: patientId ?? this.patientId,
    childId: childId ?? this.childId,
    doctorP: doctorP ?? this.doctorP,
    prescriptionMedicines: prescriptionMedicines ?? this.prescriptionMedicines,
  );

  factory PrescriptionModel.fromRawJson(String str) =>
      PrescriptionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrescriptionModel.fromJson(Map<String, dynamic>? json) =>
      json == null
          ? PrescriptionModel()
          : PrescriptionModel(
            prescriptionsId: json["prescriptionsId"],
            code: json["code"],
            note: json["note"],
            createdAt:
                json["createdAt"] == null
                    ? null
                    : DateTime.parse(json["createdAt"]),
            updatedAt:
                json["updatedAt"] == null
                    ? null
                    : DateTime.parse(json["updatedAt"]),
            clinicId: json["clinic_id"],
            doctorId: json["doctor_id"],
            patientId: json["patient_id"],
            childId: json["child_id"],
            doctorP:
                json["doctorP"] == null
                    ? null
                    : DoctorModel.fromJson(json["doctorP"]),
            prescriptionMedicines:
                json["prescription_medicines"] == null
                    ? []
                    : List<PrescriptionMedicine>.from(
                      json["prescription_medicines"]!.map(
                        (x) => PrescriptionMedicine.fromJson(x),
                      ),
                    ),
          );

  @override
  Map<String, dynamic> toJson() => {
    "prescriptionsId": prescriptionsId,
    "code": code,
    "note": note,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "clinic_id": clinicId,
    "doctor_id": doctorId,
    "patient_id": patientId,
    "child_id": childId,
    "doctorP": doctorP?.toJson(),
    "prescription_medicines":
        prescriptionMedicines == null
            ? []
            : List<dynamic>.from(prescriptionMedicines!.map((x) => x.toJson())),
  };

  @override
  GeneralModel fromJson(json) {
    return PrescriptionModel.fromJson(json);
  }
}
