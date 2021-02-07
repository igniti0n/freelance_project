// To parse this JSON data, do
//
//     final performanceReportModel = performanceReportModelFromJson(jsonString);

import 'dart:convert';

PerformanceReportModel performanceReportModelFromJson(String str) =>
    PerformanceReportModel.fromJson(json.decode(str));

String performanceReportModelToJson(PerformanceReportModel data) =>
    json.encode(data.toJson());

class PerformanceReportModel {
  PerformanceReportModel({
    this.statusCode,
    this.data,
    this.message,
  });

  int statusCode;
  ReportDetails data;
  String message;

  factory PerformanceReportModel.fromJson(Map<String, dynamic> json) =>
      PerformanceReportModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        data:
            json["data"] == null ? null : ReportDetails.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "data": data == null ? null : data.toJson(),
        "message": message == null ? null : message,
      };
}

class ReportDetails {
  ReportDetails({
    this.id,
    this.description,
    this.socialMedia,
    this.adId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String description;
  String socialMedia;
  String adId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ReportDetails.fromJson(Map<String, dynamic> json) => ReportDetails(
        id: json["_id"] == null ? null : json["_id"],
        description: json["description"] == null ? null : json["description"],
        socialMedia: json["social_media"] == null ? null : json["social_media"],
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
        "ad_id": adId == null ? null : adId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
