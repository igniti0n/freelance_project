// To parse this JSON data, do
//
//     final performanceListModel = performanceListModelFromJson(jsonString);

import 'dart:convert';

PerformanceListModel performanceListModelFromJson(String str) =>
    PerformanceListModel.fromJson(json.decode(str));

String performanceListModelToJson(PerformanceListModel data) =>
    json.encode(data.toJson());

class PerformanceListModel {
  PerformanceListModel({
    this.statusCode,
    this.data,
  });

  int statusCode;
  List<PerformanceDetails> data;

  factory PerformanceListModel.fromJson(Map<String, dynamic> json) =>
      PerformanceListModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        data: json["data"] == null
            ? null
            : List<PerformanceDetails>.from(
                json["data"].map((x) => PerformanceDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PerformanceDetails {
  PerformanceDetails({
    this.id,
    this.description,
    this.socialMedia,
    this.attach,
    this.adId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String description;
  String socialMedia;
  String attach;
  String adId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory PerformanceDetails.fromJson(Map<String, dynamic> json) =>
      PerformanceDetails(
        id: json["_id"] == null ? null : json["_id"],
        description: json["description"] == null ? null : json["description"],
        socialMedia: json["social_media"] == null ? null : json["social_media"],
        attach: json["attach"] == null ? null : json["attach"],
        adId: json["ad_id"] == null ? null : json["ad_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "description": description == null ? null : description,
        "social_media": socialMedia == null ? null : socialMedia,
        "attach": attach == null ? null : attach,
        "ad_id": adId == null ? null : adId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
