// To parse this JSON data, do
//
//     final statsDataModel = statsDataModelFromJson(jsonString);

import 'dart:convert';

StatsDataModel statsDataModelFromJson(String str) =>
    StatsDataModel.fromJson(json.decode(str));

String statsDataModelToJson(StatsDataModel data) => json.encode(data.toJson());

class StatsDataModel {
  StatsDataModel({
    this.statusCode,
    this.data,
  });

  int statusCode;
  StatsDetailDataModel data;

  factory StatsDataModel.fromJson(Map<String, dynamic> json) => StatsDataModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        data: json["data"] == null
            ? null
            : StatsDetailDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "data": data == null ? null : data.toJson(),
      };
}

class StatsDetailDataModel {
  StatsDetailDataModel({
    this.title,
    this.year,
    this.stats,
  });

  String title;
  int year;
  Map<String, Stat> stats;

  factory StatsDetailDataModel.fromJson(Map<String, dynamic> json) =>
      StatsDetailDataModel(
        title: json["title"] == null ? null : json["title"],
        year: json["year"] == null ? null : json["year"],
        stats: json["stats"] == null
            ? null
            : Map.from(json["stats"])
                .map((k, v) => MapEntry<String, Stat>(k, Stat.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "year": year == null ? null : year,
        "stats": stats == null
            ? null
            : Map.from(stats)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Stat {
  Stat({
    this.availableAds,
    this.completedAds,
    this.avgComp,
  });

  int availableAds;
  int completedAds;
  int avgComp;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        availableAds:
            json["Available_Ads"] == null ? null : json["Available_Ads"],
        completedAds:
            json["Completed_Ads"] == null ? null : json["Completed_Ads"],
        avgComp: json["Avg_Comp"] == null ? null : json["Avg_Comp"],
      );

  Map<String, dynamic> toJson() => {
        "Available_Ads": availableAds == null ? null : availableAds,
        "Completed_Ads": completedAds == null ? null : completedAds,
        "Avg_Comp": avgComp == null ? null : avgComp,
      };
}
