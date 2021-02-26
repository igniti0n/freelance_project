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
    this.dateCollected,
    this.socialMedia,
    this.adId,
    this.attach,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.ad,
  });

  String id;
  String description;
  DateTime dateCollected;
  List<dynamic> socialMedia;
  String adId;
  String attach;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<Ad> ad;

  factory PerformanceDetails.fromJson(Map<String, dynamic> json) =>
      PerformanceDetails(
        id: json["_id"] == null ? null : json["_id"],
        description: json["description"] == null ? null : json["description"],
        dateCollected: json["date_collected"] == null
            ? null
            : DateTime.parse(json["date_collected"]),
        socialMedia: json["social_media"] == null
            ? null
            : List<dynamic>.from(json["social_media"].map((x) => x)),
        adId: json["ad_id"] == null ? null : json["ad_id"],
        attach: json["attach"] == null ? null : json["attach"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        ad: json["Ad"] == null
            ? null
            : List<Ad>.from(json["Ad"].map((x) => Ad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "description": description == null ? null : description,
        "date_collected": dateCollected == null
            ? null
            : "${dateCollected.year.toString().padLeft(4, '0')}-${dateCollected.month.toString().padLeft(2, '0')}-${dateCollected.day.toString().padLeft(2, '0')}",
        "social_media": socialMedia == null
            ? null
            : List<dynamic>.from(socialMedia.map((x) => x)),
        "ad_id": adId == null ? null : adId,
        "attach": attach == null ? null : attach,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "Ad": ad == null ? null : List<dynamic>.from(ad.map((x) => x.toJson())),
      };
}

class Ad {
  Ad({
    this.id,
    this.description,
    this.adsType,
    this.title,
    this.deadline,
    this.amount,
    this.facebookTarget,
    this.twitterTarget,
    this.instagramTarget,
    this.youtubeTarget,
    this.userId,
    this.tierId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.tag,
  });

  String id;
  String description;
  String adsType;
  String title;
  DateTime deadline;
  String amount;
  int facebookTarget;
  int twitterTarget;
  int instagramTarget;
  int youtubeTarget;
  String userId;
  String tierId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String tag;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        id: json["_id"] == null ? null : json["_id"],
        description: json["description"] == null ? null : json["description"],
        adsType: json["ads_type"] == null ? null : json["ads_type"],
        title: json["title"] == null ? null : json["title"],
        deadline:
            json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
        amount: json["amount"] == null ? null : json["amount"],
        facebookTarget:
            json["facebook_target"] == null ? null : json["facebook_target"],
        twitterTarget:
            json["twitter_target"] == null ? null : json["twitter_target"],
        instagramTarget:
            json["instagram_target"] == null ? null : json["instagram_target"],
        youtubeTarget:
            json["youtube_target"] == null ? null : json["youtube_target"],
        userId: json["user_id"] == null ? null : json["user_id"],
        tierId: json["tier_id"] == null ? null : json["tier_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        tag: json["tag"] == null ? null : json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "description": description == null ? null : description,
        "ads_type": adsType == null ? null : adsType,
        "title": title == null ? null : title,
        "deadline": deadline == null ? null : deadline.toIso8601String(),
        "amount": amount == null ? null : amount,
        "facebook_target": facebookTarget == null ? null : facebookTarget,
        "twitter_target": twitterTarget == null ? null : twitterTarget,
        "instagram_target": instagramTarget == null ? null : instagramTarget,
        "youtube_target": youtubeTarget == null ? null : youtubeTarget,
        "user_id": userId == null ? null : userId,
        "tier_id": tierId == null ? null : tierId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "tag": tag == null ? null : tag,
      };
}
