// To parse this JSON data, do
//
//     final profileUpdateModel = profileUpdateModelFromJson(jsonString);

import 'dart:convert';

import 'package:test_project_one/app/data/models/profileModel.dart';

import 'login.dart';

ProfileUpdateModel profileUpdateModelFromJson(String str) =>
    ProfileUpdateModel.fromJson(json.decode(str));

String profileUpdateModelToJson(ProfileUpdateModel data) =>
    json.encode(data.toJson());

class ProfileUpdateModel {
  ProfileUpdateModel({
    this.statusCode,
    this.message,
    this.data,
    this.request,
  });

  int statusCode;
  String message;
  User data;
  Request request;

  factory ProfileUpdateModel.fromJson(Map<String, dynamic> json) =>
      ProfileUpdateModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : User.fromJson(json["data"]),
        request:
            json["request"] == null ? null : Request.fromJson(json["request"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
        "request": request == null ? null : request.toJson(),
      };
}

class Request {
  Request({
    this.bankId,
    this.accountName,
    this.accountNumber,
  });

  String bankId;
  String accountName;
  String accountNumber;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        bankId: json["bank_id"] == null ? null : json["bank_id"],
        accountName: json["account_name"] == null ? null : json["account_name"],
        accountNumber:
            json["account_number"] == null ? null : json["account_number"],
      );

  Map<String, dynamic> toJson() => {
        "bank_id": bankId == null ? null : bankId,
        "account_name": accountName == null ? null : accountName,
        "account_number": accountNumber == null ? null : accountNumber,
      };
}
