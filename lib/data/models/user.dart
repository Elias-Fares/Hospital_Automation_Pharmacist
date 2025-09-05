import 'dart:convert';

class User {
  final int? userId;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? imgurl;
  final String? email;

  User({this.userId, this.firstName, this.lastName, this.imgurl, this.email, this.middleName});

  User copyWith({
    int? userId,
    String? firstName,
    String? middleName,
    String? lastName,
    String? imgurl,
    String? email,
  }) => User(
    userId: userId ?? this.userId,
    firstName: firstName ?? this.firstName,
    middleName: middleName?? this.middleName,
    lastName: lastName ?? this.lastName,
    imgurl: imgurl ?? this.imgurl,
    email: email ?? this.email,
  );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    firstName: json["first_name"],
    middleName: json["middle_name"],
    lastName: json["last_name"],
    imgurl: json["imgurl"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "first_name": firstName,
    "last_name": lastName,
    "imgurl": imgurl,
    "email": email,
    "middle_name": middleName,
  };
}
