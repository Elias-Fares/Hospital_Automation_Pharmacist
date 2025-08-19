import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';
import 'package:medicare_pharmacy/data/models/order_model.dart';

class InventoryModel extends GeneralModel {
  final List<OrderModel>? data;
  final int? total;

  InventoryModel({this.data, this.total});

  InventoryModel copyWith({List<OrderModel>? data, int? total}) =>
      InventoryModel(data: data ?? this.data, total: total ?? this.total);

  factory InventoryModel.fromRawJson(String str) =>
      InventoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InventoryModel.fromJson(Map<String, dynamic> json) => InventoryModel(
    data:
        json["data"] == null
            ? []
            : List<OrderModel>.from(
              json["data"]!.map((x) => OrderModel.fromJson(x)),
            ),
    total: json["total"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "total": total,
  };

  @override
  GeneralModel fromJson(json) {
    return InventoryModel.fromJson(json);
  }
}
