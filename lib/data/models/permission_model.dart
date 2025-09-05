import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';

class PermissionModel extends GeneralModel {
  final bool? message;

  PermissionModel({this.message});

  PermissionModel copyWith({bool? message}) =>
      PermissionModel(message: message ?? this.message);

  factory PermissionModel.fromRawJson(String str) =>
      PermissionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      PermissionModel(message: json["message"]);

  @override
  Map<String, dynamic> toJson() => {"message": message};

  @override
  GeneralModel fromJson(json) {
    return PermissionModel.fromJson(json);
  }
}
