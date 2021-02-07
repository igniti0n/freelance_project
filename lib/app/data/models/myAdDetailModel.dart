// To parse this JSON data, do
//
//     final myAdDetailModel = myAdDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:test_project_one/app/data/models/homeAds.dart';

MyAdDetailModel myAdDetailModelFromJson(String str) =>
    MyAdDetailModel.fromJson(json.decode(str));

String myAdDetailModelToJson(MyAdDetailModel data) =>
    json.encode(data.toJson());

class MyAdDetailModel {
  MyAdDetailModel({
    this.statusCode,
    this.data,
  });

  int statusCode;
  List<AdsDetailModel> data;

  factory MyAdDetailModel.fromJson(Map<String, dynamic> json) =>
      MyAdDetailModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        data: json["data"] == null
            ? null
            : List<AdsDetailModel>.from(
                json["data"].map((x) => AdsDetailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
