// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.statusCode,
    this.message,
    this.token,
    this.user,
    this.request,
  });

  int statusCode;
  String message;
  String token;
  User user;
  Request request;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        message: json["message"] == null ? null : json["message"],
        token: json["token"] == null ? null : json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        request:
            json["request"] == null ? null : Request.fromJson(json["request"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "token": token == null ? null : token,
        "user": user == null ? null : user.toJson(),
        "request": request == null ? null : request.toJson(),
      };

  static Future<LoginModel> fromPrefs() async {
    final pref = await SharedPreferences.getInstance();
    String userData = pref.getString(kUserData);
    if (userData == null) return null;
    return loginModelFromJson(userData);
  }
}

class Request {
  Request({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "password": password == null ? null : password,
      };
}

class User {
  User({
    this.role,
    this.image,
    this.id,
    this.firstname,
    this.lastname,
    this.gender,
    this.dateOfBirth,
    this.religion,
    this.levelOfEducation,
    this.address,
    this.email,
    this.password,
    this.phone,
    this.facebook,
    this.twitter,
    this.instagram,
    this.youtube,
    this.countryId,
    this.tierId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.accountName,
    this.accountNumber,
    this.bankId,
  });

  String role;
  String image;
  String id;
  String firstname;
  String lastname;
  String gender;
  String dateOfBirth;
  String religion;
  String levelOfEducation;
  String address;
  String email;
  String password;
  String phone;
  String facebook;
  String twitter;
  String instagram;
  String youtube;
  String countryId;
  String tierId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String accountName;
  String accountNumber;
  String bankId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        role: json["role"] == null ? null : json["role"],
        image: json["image"] == null ? null : json["image"],
        id: json["_id"] == null ? null : json["_id"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        gender: json["gender"] == null ? null : json["gender"],
        dateOfBirth:
            json["date_of_birth"] == null ? null : json["date_of_birth"],
        religion: json["religion"] == null ? null : json["religion"],
        levelOfEducation: json["level_of_education"] == null
            ? null
            : json["level_of_education"],
        address: json["address"] == null ? null : json["address"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        phone: json["phone"] == null ? null : json["phone"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        youtube: json["youtube"] == null ? null : json["youtube"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        tierId: json["tier_id"] == null ? null : json["tier_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        accountName: json["account_name"] == null ? null : json["account_name"],
        accountNumber:
            json["account_number"] == null ? null : json["account_number"],
        bankId: json["bank_id"] == null ? null : json["bank_id"],
      );

  Map<String, dynamic> toJson() => {
        "role": role == null ? null : role,
        "image": image == null ? null : image,
        "_id": id == null ? null : id,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "gender": gender == null ? null : gender,
        "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
        "religion": religion == null ? null : religion,
        "level_of_education":
            levelOfEducation == null ? null : levelOfEducation,
        "address": address == null ? null : address,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "phone": phone == null ? null : phone,
        "facebook": facebook == null ? null : facebook,
        "twitter": twitter == null ? null : twitter,
        "instagram": instagram == null ? null : instagram,
        "youtube": youtube == null ? null : youtube,
        "country_id": countryId == null ? null : countryId,
        "tier_id": tierId == null ? null : tierId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "account_name": accountName == null ? null : accountName,
        "account_number": accountNumber == null ? null : accountNumber,
        "bank_id": bankId == null ? null : bankId,
      };
}
