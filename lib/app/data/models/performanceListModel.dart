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
    this.ad,
    this.socialMediaId,
    this.dateCollected,
  });

  String id;
  String description;
  List<SocialMedia> socialMedia;
  String attach;
  AdId adId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<dynamic> ad;
  String socialMediaId;
  String dateCollected;

  factory PerformanceDetails.fromJson(Map<String, dynamic> json) =>
      PerformanceDetails(
        id: json["_id"] == null ? null : json["_id"],
        description: json["description"] == null ? null : json["description"],
        socialMedia: json["social_media"] == null
            ? null
            : List<SocialMedia>.from(
                json["social_media"].map((x) => SocialMedia.fromJson(x))),
        attach: json["attach"] == null ? null : json["attach"],
        adId: json["ad_id"] == null ? null : adIdValues.map[json["ad_id"]],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        ad: json["Ad"] == null
            ? null
            : List<dynamic>.from(json["Ad"].map((x) => x)),
        socialMediaId:
            json["social_media_id"] == null ? null : json["social_media_id"],
        dateCollected:
            json["date_collected"] == null ? null : json["date_collected"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "description": description == null ? null : description,
        "social_media": socialMedia == null
            ? null
            : List<dynamic>.from(socialMedia.map((x) => x.toJson())),
        "attach": attach == null ? null : attach,
        "ad_id": adId == null ? null : adIdValues.reverse[adId],
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "Ad": ad == null ? null : List<dynamic>.from(ad.map((x) => x)),
        "social_media_id": socialMediaId == null ? null : socialMediaId,
        "date_collected": dateCollected == null ? null : dateCollected,
      };
}

enum AdId { THE_601824_EAAA6_BA9270898347_F }

final adIdValues = EnumValues(
    {"601824eaaa6ba9270898347f": AdId.THE_601824_EAAA6_BA9270898347_F});

class SocialMedia {
  SocialMedia({
    this.id,
    this.socialMedia,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String socialMedia;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
        id: json["_id"] == null ? null : json["_id"],
        socialMedia: json["social_media"] == null ? null : json["social_media"],
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
        "social_media": socialMedia == null ? null : socialMedia,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
