// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
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
        this.accountName,
        this.accountNumber,
        this.facebook,
        this.twitter,
        this.instagram,
        this.youtube,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.bankId,
        this.resetPassword,
    });

    String id;
    String role;
    String firstname;
    String lastname;
    String gender;
    String dateOfBirth;
    String religion;
    String levelOfEducation;
    String country;
    String address;
    String email;
    String password;
    String phone;
    String accountName;
    String accountNumber;
    String facebook;
    String twitter;
    String instagram;
    String youtube;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String bankId;
    List<ResetPassword> resetPassword;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["_id"],
        role: json["role"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        religion: json["religion"],
        levelOfEducation: json["level_of_education"],
        country: json["country"],
        address: json["address"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        instagram: json["instagram"],
        youtube: json["youtube"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        bankId: json["bank_id"],
        resetPassword: List<ResetPassword>.from(json["resetPassword"].map((x) => ResetPassword.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "role": role,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "religion": religion,
        "level_of_education": levelOfEducation,
        "country": country,
        "address": address,
        "email": email,
        "password": password,
        "phone": phone,
        "account_name": accountName,
        "account_number": accountNumber,
        "facebook": facebook,
        "twitter": twitter,
        "instagram": instagram,
        "youtube": youtube,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "bank_id": bankId,
        "resetPassword": List<dynamic>.from(resetPassword.map((x) => x.toJson())),
    };
}

class ResetPassword {
    ResetPassword({
        this.id,
        this.token,
        this.expire,
    });

    String id;
    int token;
    int expire;

    factory ResetPassword.fromJson(Map<String, dynamic> json) => ResetPassword(
        id: json["_id"],
        token: json["token"],
        expire: json["expire"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "token": token,
        "expire": expire,
    };
}
