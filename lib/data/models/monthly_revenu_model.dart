import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';

class MonthlyRevenuModel extends GeneralModel {
  final String? month;
  final MonthlyRevenu? monthlyRevenu;

  MonthlyRevenuModel({this.month, this.monthlyRevenu});

  MonthlyRevenuModel copyWith({String? month, MonthlyRevenu? monthlyRevenu}) =>
      MonthlyRevenuModel(
        month: month ?? this.month,
        monthlyRevenu: monthlyRevenu ?? this.monthlyRevenu,
      );

  factory MonthlyRevenuModel.fromRawJson(String str) =>
      MonthlyRevenuModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MonthlyRevenuModel.fromJson(Map<String, dynamic> json) =>
      MonthlyRevenuModel(
        month: json["month"],
        monthlyRevenu:
            json["monthly_Revenu"] == null
                ? null
                : MonthlyRevenu.fromJson(json["monthly_Revenu"]),
      );

  @override
  Map<String, dynamic> toJson() => {
    "month": month,
    "monthly_Revenu": monthlyRevenu?.toJson(),
  };

  @override
  GeneralModel fromJson(json) {
    return MonthlyRevenuModel.fromJson(json);
  }
}

class MonthlyRevenu {
  final dynamic monthlyRevenue;

  MonthlyRevenu({this.monthlyRevenue});

  MonthlyRevenu copyWith({dynamic monthlyRevenue}) =>
      MonthlyRevenu(monthlyRevenue: monthlyRevenue ?? this.monthlyRevenue);

  factory MonthlyRevenu.fromRawJson(String str) =>
      MonthlyRevenu.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MonthlyRevenu.fromJson(Map<String, dynamic> json) =>
      MonthlyRevenu(monthlyRevenue: json["monthly_revenue"]);

  Map<String, dynamic> toJson() => {"monthly_revenue": monthlyRevenue};
}
