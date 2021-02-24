// To parse this JSON data, do
//
//     final homeAdsModel = homeAdsModelFromJson(jsonString);

import 'dart:convert';

HomeAdsModel homeAdsModelFromJson(String str) =>
    HomeAdsModel.fromJson(json.decode(str));

String homeAdsModelToJson(HomeAdsModel data) => json.encode(data.toJson());

class HomeAdsModel {
  HomeAdsModel({
    this.statusCode,
    this.data,
  });

  int statusCode;
  List<AdsDetailModel> data;

  factory HomeAdsModel.fromJson(Map<String, dynamic> json) => HomeAdsModel(
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

class AdsDetailModel {
  AdsDetailModel({
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
    this.tier,
    this.resources,
    this.status,
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
  List<Tier> tier;
  List<Resource> resources;
  String status;

  factory AdsDetailModel.fromJson(Map<String, dynamic> json) => AdsDetailModel(
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
        tier: json["tier"] == null
            ? null
            : List<Tier>.from(json["tier"].map((x) => Tier.fromJson(x))),
        resources: json["resources"] == null
            ? null
            : List<Resource>.from(
                json["resources"].map((x) => Resource.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
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
        "tier": tier == null
            ? null
            : List<dynamic>.from(tier.map((x) => x.toJson())),
        "resources": resources == null
            ? null
            : List<dynamic>.from(resources.map((x) => x.toJson())),
        "status": status == null ? null : status,
      };
}

class Resource {
  Resource({
    this.id,
    this.title,
    this.url,
    this.adId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String title;
  String url;
  String adId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
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
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "ad_id": adId == null ? null : adId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Tier {
  Tier({
    this.id,
    this.tier,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String tier;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
        id: json["_id"] == null ? null : json["_id"],
        tier: json["tier"] == null ? null : json["tier"],
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
        "tier": tier == null ? null : tier,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
