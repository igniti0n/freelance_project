// To parse this JSON data, do
//
//     final myAdsModel = myAdsModelFromJson(jsonString);

import 'dart:convert';
import 'homeAds.dart';

MyAdsModel myAdsModelFromJson(String str) =>
    MyAdsModel.fromJson(json.decode(str));

String myAdsModelToJson(MyAdsModel data) => json.encode(data.toJson());

class MyAdsModel {
  MyAdsModel({
    this.statusCode,
    this.data,
    this.request,
  });

  int statusCode;
  List<MyAdsDataModel> data;
  Request request;

  factory MyAdsModel.fromJson(Map<String, dynamic> json) => MyAdsModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        data: json["data"] == null
            ? null
            : List<MyAdsDataModel>.from(
                json["data"].map((x) => MyAdsDataModel.fromJson(x))),
        request:
            json["request"] == null ? null : Request.fromJson(json["request"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "request": request == null ? null : request.toJson(),
      };
}

class MyAdsDataModel {
  MyAdsDataModel({
    this.id,
    this.adId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.ad,
  });

  String id;
  String adId;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<AdsDetailModel> ad;

  factory MyAdsDataModel.fromJson(Map<String, dynamic> json) => MyAdsDataModel(
        id: json["_id"] == null ? null : json["_id"],
        adId: json["ad_id"] == null ? null : json["ad_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        ad: json["Ad"] == null
            ? null
            : List<AdsDetailModel>.from(
                json["Ad"].map((x) => AdsDetailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "ad_id": adId == null ? null : adId,
        "user_id": userId == null ? null : userId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "Ad": ad == null ? null : List<dynamic>.from(ad.map((x) => x.toJson())),
      };
}

class Request {
  Request();

  factory Request.fromJson(Map<String, dynamic> json) => Request();

  Map<String, dynamic> toJson() => {};
}
