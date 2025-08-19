import 'dart:convert';

class DoctorModel {
    final int? userId;
    final String? firstName;
    final String? middleName;
    final String? lastName;
    final String? specialty;
    final String? imgurl;

    DoctorModel({
        this.userId,
        this.firstName,
        this.middleName,
        this.lastName,
        this.specialty,
        this.imgurl,
    });

    DoctorModel copyWith({
        int? userId,
        String? firstName,
        String? middleName,
        String? lastName,
        String? specialty,
        String? imgurl,
    }) => 
        DoctorModel(
            userId: userId ?? this.userId,
            firstName: firstName ?? this.firstName,
            middleName: middleName ?? this.middleName,
            lastName: lastName ?? this.lastName,
            specialty: specialty ?? this.specialty,
            imgurl: imgurl ?? this.imgurl,
        );

    factory DoctorModel.fromRawJson(String str) => DoctorModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        userId: json["userId"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        specialty: json["specialty"],
        imgurl: json["imgurl"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "specialty": specialty,
        "imgurl": imgurl,
    };
}
