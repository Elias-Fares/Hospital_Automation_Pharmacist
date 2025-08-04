import 'dart:convert';

import '../../../core/base_dio/general_model.dart';

class UserModel extends GeneralModel {
  final int? userId;
  final String? role;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final bool? verifiedResetPassword;
  final bool? verifiedAccount;
  final String? phoneNumber;
  final dynamic addressGovernorate;
  final dynamic addressCity;
  final dynamic addressRegion;
  final dynamic addressStreet;
  final dynamic addressNote;
  final dynamic specialty;
  final dynamic imgurl;
  final dynamic medicalLicenseImgUrl;
  final String? gender;
  final bool? isSuspended;
  final dynamic suspendingReason;
  final bool? isResigned;
  final dynamic workStartDate;
  final dynamic workEndDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic clinicId;
  final dynamic resignedBy;
  final dynamic suspendedBy;
  final dynamic acceptedBy;

  UserModel({
    this.userId,
    this.role,
    this.email,
    this.firstName,
    this.lastName,
    this.middleName,
    this.verifiedResetPassword,
    this.verifiedAccount,
    this.phoneNumber,
    this.addressGovernorate,
    this.addressCity,
    this.addressRegion,
    this.addressStreet,
    this.addressNote,
    this.specialty,
    this.imgurl,
    this.medicalLicenseImgUrl,
    this.gender,
    this.isSuspended,
    this.suspendingReason,
    this.isResigned,
    this.workStartDate,
    this.workEndDate,
    this.createdAt,
    this.updatedAt,
    this.clinicId,
    this.resignedBy,
    this.suspendedBy,
    this.acceptedBy,
  });

  UserModel copyWith({
    int? userId,
    String? role,
    String? email,
    String? firstName,
    String? lastName,
    String? middleName,
    bool? verifiedResetPassword,
    bool? verifiedAccount,
    String? phoneNumber,
    dynamic addressGovernorate,
    dynamic addressCity,
    dynamic addressRegion,
    dynamic addressStreet,
    dynamic addressNote,
    dynamic specialty,
    dynamic imgurl,
    dynamic medicalLicenseImgUrl,
    String? gender,
    bool? isSuspended,
    dynamic suspendingReason,
    bool? isResigned,
    dynamic workStartDate,
    dynamic workEndDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic clinicId,
    dynamic resignedBy,
    dynamic suspendedBy,
    dynamic acceptedBy,
  }) =>
      UserModel(
        userId: userId ?? this.userId,
        role: role ?? this.role,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        middleName: middleName ?? this.middleName,
        verifiedResetPassword:
            verifiedResetPassword ?? this.verifiedResetPassword,
        verifiedAccount: verifiedAccount ?? this.verifiedAccount,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        addressGovernorate: addressGovernorate ?? this.addressGovernorate,
        addressCity: addressCity ?? this.addressCity,
        addressRegion: addressRegion ?? this.addressRegion,
        addressStreet: addressStreet ?? this.addressStreet,
        addressNote: addressNote ?? this.addressNote,
        specialty: specialty ?? this.specialty,
        imgurl: imgurl ?? this.imgurl,
        medicalLicenseImgUrl: medicalLicenseImgUrl ?? this.medicalLicenseImgUrl,
        gender: gender ?? this.gender,
        isSuspended: isSuspended ?? this.isSuspended,
        suspendingReason: suspendingReason ?? this.suspendingReason,
        isResigned: isResigned ?? this.isResigned,
        workStartDate: workStartDate ?? this.workStartDate,
        workEndDate: workEndDate ?? this.workEndDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        clinicId: clinicId ?? this.clinicId,
        resignedBy: resignedBy ?? this.resignedBy,
        suspendedBy: suspendedBy ?? this.suspendedBy,
        acceptedBy: acceptedBy ?? this.acceptedBy,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        role: json["role"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        middleName: json["middle_name"],
        verifiedResetPassword: json["verified_reset_password"],
        verifiedAccount: json["verified_account"],
        phoneNumber: json["phone_number"],
        addressGovernorate: json["address_governorate"],
        addressCity: json["address_city"],
        addressRegion: json["address_region"],
        addressStreet: json["address_street"],
        addressNote: json["address_note"],
        specialty: json["specialty"],
        imgurl: json["imgurl"],
        medicalLicenseImgUrl: json["medical_license_img_url"],
        gender: json["gender"],
        isSuspended: json["is_suspended"],
        suspendingReason: json["suspending_reason"],
        isResigned: json["is_resigned"],
        workStartDate: json["work_start_date"],
        workEndDate: json["work_end_date"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        clinicId: json["clinic_id"],
        resignedBy: json["resigned_by"],
        suspendedBy: json["suspended_by"],
        acceptedBy: json["accepted_by"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "role": role,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "middle_name": middleName,
        "verified_reset_password": verifiedResetPassword,
        "verified_account": verifiedAccount,
        "phone_number": phoneNumber,
        "address_governorate": addressGovernorate,
        "address_city": addressCity,
        "address_region": addressRegion,
        "address_street": addressStreet,
        "address_note": addressNote,
        "specialty": specialty,
        "imgurl": imgurl,
        "medical_license_img_url": medicalLicenseImgUrl,
        "gender": gender,
        "is_suspended": isSuspended,
        "suspending_reason": suspendingReason,
        "is_resigned": isResigned,
        "work_start_date": workStartDate,
        "work_end_date": workEndDate,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "clinic_id": clinicId,
        "resigned_by": resignedBy,
        "suspended_by": suspendedBy,
        "accepted_by": acceptedBy,
      };

  @override
  GeneralModel fromJson(json) {
    return UserModel.fromJson(json);
  }
}
