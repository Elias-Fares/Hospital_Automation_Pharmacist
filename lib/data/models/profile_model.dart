import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';
import 'package:medicare_pharmacy/core/models/work_day.dart';

class ProfileModel extends GeneralModel {
  final int? pharmacyId;
  final String? name;
  final String? addressGovernorate;
  final String? addressCity;
  final String? addressRegion;
  final String? addressStreet;
  final String? addressNote;
  final String? phoneNumber;
  final dynamic isDeactivated;
  final dynamic deactivationReason;
  final dynamic contractStartDate;
  final dynamic contractEndDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deactivatedBy;
  final int? pharmacistId;
  final User? user;
  final List<WorkDay>? workDays;

  ProfileModel({
    this.pharmacyId,
    this.name,
    this.addressGovernorate,
    this.addressCity,
    this.addressRegion,
    this.addressStreet,
    this.addressNote,
    this.phoneNumber,
    this.isDeactivated,
    this.deactivationReason,
    this.contractStartDate,
    this.contractEndDate,
    this.createdAt,
    this.updatedAt,
    this.deactivatedBy,
    this.pharmacistId,
    this.user,
    this.workDays,
  });

  ProfileModel copyWith({
    int? pharmacyId,
    String? name,
    String? addressGovernorate,
    String? addressCity,
    String? addressRegion,
    String? addressStreet,
    String? addressNote,
    String? phoneNumber,
    dynamic isDeactivated,
    dynamic deactivationReason,
    dynamic contractStartDate,
    dynamic contractEndDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deactivatedBy,
    int? pharmacistId,
    User? user,
    List<WorkDay>? workDays,
  }) => ProfileModel(
    pharmacyId: pharmacyId ?? this.pharmacyId,
    name: name ?? this.name,
    addressGovernorate: addressGovernorate ?? this.addressGovernorate,
    addressCity: addressCity ?? this.addressCity,
    addressRegion: addressRegion ?? this.addressRegion,
    addressStreet: addressStreet ?? this.addressStreet,
    addressNote: addressNote ?? this.addressNote,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    isDeactivated: isDeactivated ?? this.isDeactivated,
    deactivationReason: deactivationReason ?? this.deactivationReason,
    contractStartDate: contractStartDate ?? this.contractStartDate,
    contractEndDate: contractEndDate ?? this.contractEndDate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deactivatedBy: deactivatedBy ?? this.deactivatedBy,
    pharmacistId: pharmacistId ?? this.pharmacistId,
    user: user ?? this.user,
    workDays: workDays ?? this.workDays,
  );

  factory ProfileModel.fromRawJson(String str) =>
      ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    pharmacyId: json["pharmacyId"],
    name: json["name"],
    addressGovernorate: json["address_governorate"],
    addressCity: json["address_city"],
    addressRegion: json["address_region"],
    addressStreet: json["address_street"],
    addressNote: json["address_note"],
    phoneNumber: json["phoneNumber"],
    isDeactivated: json["is_deactivated"],
    deactivationReason: json["deactivation_reason"],
    contractStartDate: json["contract_start_date"],
    contractEndDate: json["contract_end_date"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deactivatedBy: json["deactivated_by"],
    pharmacistId: json["pharmacist_id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    workDays:
        json["work_days"] == null
            ? []
            : List<WorkDay>.from(
              json["work_days"]!.map((x) => WorkDay.fromJson(x)),
            ),
  );

  @override
  Map<String, dynamic> toJson() => {
    "pharmacyId": pharmacyId,
    "name": name,
    "address_governorate": addressGovernorate,
    "address_city": addressCity,
    "address_region": addressRegion,
    "address_street": addressStreet,
    "address_note": addressNote,
    "phoneNumber": phoneNumber,
    "is_deactivated": isDeactivated,
    "deactivation_reason": deactivationReason,
    "contract_start_date": contractStartDate,
    "contract_end_date": contractEndDate,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deactivated_by": deactivatedBy,
    "pharmacist_id": pharmacistId,
    "user": user?.toJson(),
    "work_days":
        workDays == null
            ? []
            : List<dynamic>.from(workDays!.map((x) => x.toJson())),
  };

  @override
  GeneralModel fromJson(json) {
    return ProfileModel.fromJson(json);
  }
}

class User {
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? imgurl;

  User({this.userId, this.firstName, this.lastName, this.imgurl});

  User copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    String? imgurl,
  }) => User(
    userId: userId ?? this.userId,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    imgurl: imgurl ?? this.imgurl,
  );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    imgurl: json["imgurl"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "first_name": firstName,
    "last_name": lastName,
    "imgurl": imgurl,
  };
}
