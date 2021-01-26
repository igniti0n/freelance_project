// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        this.statusCode,
        this.data,
        this.request,
    });

    int statusCode;
    List<User> data;
    Request request;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        statusCode: json["status_code"],
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
        request: Request.fromJson(json["request"]),
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "request": request.toJson(),
    };
}

class User {
    User({
        this.id,
        this.role,
        this.firstname,
        this.lastname,
        this.gender,
        this.dateOfBirth,
        this.religion,
        this.levelOfEducation,
        this.country,
        this.address,
        this.email,
        this.password,
        this.phone,
        this.facebook,
        this.twitter,
        this.instagram,
        this.youtube,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.bank,
    });

    String id;
    String role;
    String firstname;
    String lastname;
    String gender;
    DateTime dateOfBirth;
    String religion;
    String levelOfEducation;
    String country;
    String address;
    String email;
    String password;
    String phone;
    String facebook;
    String twitter;
    String instagram;
    String youtube;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    List<dynamic> bank;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        role: json["role"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        religion: json["religion"],
        levelOfEducation: json["level_of_education"],
        country: json["country"],
        address: json["address"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        instagram: json["instagram"],
        youtube: json["youtube"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        bank: List<dynamic>.from(json["Bank"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "role": role,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "religion": religion,
        "level_of_education": levelOfEducation,
        "country": country,
        "address": address,
        "email": email,
        "password": password,
        "phone": phone,
        "facebook": facebook,
        "twitter": twitter,
        "instagram": instagram,
        "youtube": youtube,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "Bank": List<dynamic>.from(bank.map((x) => x)),
    };
}

class Request {
    Request();

    factory Request.fromJson(Map<String, dynamic> json) => Request(
    );

    Map<String, dynamic> toJson() => {
    };
}
