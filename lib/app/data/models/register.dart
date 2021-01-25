// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    RegisterModel({
        this.statusCode,
        this.message,
        this.token,
    });

    int statusCode;
    String message;
    String token;

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        statusCode: json["status_code"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "token": token,
    };
}
