import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';

class FakeModel extends GeneralModel {
  final dynamic data;

  FakeModel({this.data});

  FakeModel copyWith({dynamic data}) => FakeModel(data: data ?? this.data);

  factory FakeModel.fromRawJson(String str) =>
      FakeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FakeModel.fromJson(Map<String, dynamic> json) =>
      FakeModel(data: json["data"]);

  Map<String, dynamic> toJson() => {"data": data};

  @override
  GeneralModel fromJson(json) {
    return FakeModel.fromJson(json);
  }
}
