import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';

class NotificationModel extends GeneralModel {
  final int? notificationId;
  final String? title;
  final String? message;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic vaccineId;
  final int? pharmacistId;
  final dynamic requestId;
  final dynamic patientId;
  final dynamic appointmentId;

  NotificationModel({
    this.notificationId,
    this.title,
    this.message,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.vaccineId,
    this.pharmacistId,
    this.requestId,
    this.patientId,
    this.appointmentId,
  });

  NotificationModel copyWith({
    int? notificationId,
    String? title,
    String? message,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic vaccineId,
    int? pharmacistId,
    dynamic requestId,
    dynamic patientId,
    dynamic appointmentId,
  }) => NotificationModel(
    notificationId: notificationId ?? this.notificationId,
    title: title ?? this.title,
    message: message ?? this.message,
    type: type ?? this.type,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    vaccineId: vaccineId ?? this.vaccineId,
    pharmacistId: pharmacistId ?? this.pharmacistId,
    requestId: requestId ?? this.requestId,
    patientId: patientId ?? this.patientId,
    appointmentId: appointmentId ?? this.appointmentId,
  );

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(
    Map<String, dynamic> json,
  ) => NotificationModel(
    notificationId: json["notificationId"],
    title: json["title"],
    message: json["message"],
    type: json["type"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    vaccineId: json["vaccine_id"],
    pharmacistId: json["pharmacist_id"],
    requestId: json["request_id"],
    patientId: json["patient_id"],
    appointmentId: json["appointment_id"],
  );

  Map<String, dynamic> toJson() => {
    "notificationId": notificationId,
    "title": title,
    "message": message,
    "type": type,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "vaccine_id": vaccineId,
    "pharmacist_id": pharmacistId,
    "request_id": requestId,
    "patient_id": patientId,
    "appointment_id": appointmentId,
  };

  @override
  GeneralModel fromJson(json) {
    return NotificationModel.fromJson(json);
  }
}
