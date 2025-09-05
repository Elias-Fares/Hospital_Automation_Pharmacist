import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';

class WorkDay extends GeneralModel {
  final int? workDaysId;
  final String? day;
  final String? workStartTime;
  final String? workEndTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? pharmacyId;
  final int? doctorId;
  final dynamic clinicId;

  WorkDay({
    this.workDaysId,
    this.day,
    this.workStartTime,
    this.workEndTime,
    this.createdAt,
    this.updatedAt,
    this.pharmacyId,
    this.doctorId,
    this.clinicId,
  });

  WorkDay copyWith({
    int? workDaysId,
    String? day,
    String? workStartTime,
    String? workEndTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? pharmacyId,
    int? doctorId,
    dynamic clinicId,
  }) => WorkDay(
    workDaysId: workDaysId ?? this.workDaysId,
    day: day ?? this.day,
    workStartTime: workStartTime ?? this.workStartTime,
    workEndTime: workEndTime ?? this.workEndTime,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    pharmacyId: pharmacyId ?? this.pharmacyId,
    doctorId: doctorId ?? this.doctorId,
    clinicId: clinicId ?? this.clinicId,
  );

  factory WorkDay.fromRawJson(String str) => WorkDay.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WorkDay.fromJson(Map<String, dynamic> json) => WorkDay(
    workDaysId: json["work_DaysId"],
    day: json["day"],
    workStartTime: json["work_start_time"],
    workEndTime: json["work_end_time"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    pharmacyId: json["pharmacy_id"],
    doctorId: json["doctor_id"],
    clinicId: json["clinic_id"],
  );

  Map<String, dynamic> toJson() => {
    "work_DaysId": workDaysId,
    "day": day,
    "work_start_time": workStartTime,
    "work_end_time": workEndTime,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "pharmacy_id": pharmacyId,
    "doctor_id": doctorId,
    "clinic_id": clinicId,
  };

  @override
  GeneralModel fromJson(json) {
    return WorkDay.fromJson(json);
  }
}
