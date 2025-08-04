import 'dart:convert';

class User {
  final int? userId;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? specialty;
  final String? imgurl;
  final String? email;

  User({
    this.userId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.specialty,
    this.imgurl,
    this.email,
  });

  User copyWith({
    int? userId,
    String? firstName,
    String? middleName,
    String? lastName,
    String? specialty,
    String? imgurl,
    String? email,
  }) =>
      User(
          userId: userId ?? this.userId,
          firstName: firstName ?? this.firstName,
          middleName: middleName ?? this.middleName,
          lastName: lastName ?? this.lastName,
          specialty: specialty ?? this.specialty,
          imgurl: imgurl ?? this.imgurl,
          email: email ?? this.email);

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        specialty: json["specialty"],
        imgurl: json["imgurl"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "specialty": specialty,
        "imgurl": imgurl,
        "email": email,
      };
}
