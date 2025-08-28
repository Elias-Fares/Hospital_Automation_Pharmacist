import 'dart:convert';

import 'package:medicare_pharmacy/core/base_dio/general_model.dart';

class SellingModel extends GeneralModel{
    final ImumSelling? maximumSelling;
    final ImumSelling? minimumSelling;

    SellingModel({
        this.maximumSelling,
        this.minimumSelling,
    });

    SellingModel copyWith({
        ImumSelling? maximumSelling,
        ImumSelling? minimumSelling,
    }) => 
        SellingModel(
            maximumSelling: maximumSelling ?? this.maximumSelling,
            minimumSelling: minimumSelling ?? this.minimumSelling,
        );

    factory SellingModel.fromRawJson(String str) => SellingModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SellingModel.fromJson(Map<String, dynamic> json) => SellingModel(
        maximumSelling: json["maximum_selling"] == null ? null : ImumSelling.fromJson(json["maximum_selling"]),
        minimumSelling: json["minimum_selling"] == null ? null : ImumSelling.fromJson(json["minimum_selling"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum_selling": maximumSelling?.toJson(),
        "minimum_selling": minimumSelling?.toJson(),
    };
    
      @override
      GeneralModel fromJson(json) {
    return SellingModel.fromJson(json);
      }
}

class ImumSelling {
    final int? medicineId;
    final String? numberOfSellingThatItem;
    final Medicine? medicine;

    ImumSelling({
        this.medicineId,
        this.numberOfSellingThatItem,
        this.medicine,
    });

    ImumSelling copyWith({
        int? medicineId,
        String? numberOfSellingThatItem,
        Medicine? medicine,
    }) => 
        ImumSelling(
            medicineId: medicineId ?? this.medicineId,
            numberOfSellingThatItem: numberOfSellingThatItem ?? this.numberOfSellingThatItem,
            medicine: medicine ?? this.medicine,
        );

    factory ImumSelling.fromRawJson(String str) => ImumSelling.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ImumSelling.fromJson(Map<String, dynamic> json) => ImumSelling(
        medicineId: json["medicine_id"],
        numberOfSellingThatItem: json["number_of_selling_that_item"],
        medicine: json["medicine"] == null ? null : Medicine.fromJson(json["medicine"]),
    );

    Map<String, dynamic> toJson() => {
        "medicine_id": medicineId,
        "number_of_selling_that_item": numberOfSellingThatItem,
        "medicine": medicine?.toJson(),
    };
}

class Medicine {
    final int? medicinesId;
    final String? name;
    final int? pharmaceuticalTiter;
    final String? medImageUrl;

    Medicine({
        this.medicinesId,
        this.name,
        this.pharmaceuticalTiter,
        this.medImageUrl,
    });

    Medicine copyWith({
        int? medicinesId,
        String? name,
        int? pharmaceuticalTiter,
        String? medImageUrl,
    }) => 
        Medicine(
            medicinesId: medicinesId ?? this.medicinesId,
            name: name ?? this.name,
            pharmaceuticalTiter: pharmaceuticalTiter ?? this.pharmaceuticalTiter,
            medImageUrl: medImageUrl ?? this.medImageUrl,
        );

    factory Medicine.fromRawJson(String str) => Medicine.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        medicinesId: json["medicinesId"],
        name: json["name"],
        pharmaceuticalTiter: json["pharmaceuticalTiter"],
        medImageUrl: json["medImageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "medicinesId": medicinesId,
        "name": name,
        "pharmaceuticalTiter": pharmaceuticalTiter,
        "medImageUrl": medImageUrl,
    };
}
