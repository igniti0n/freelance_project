// To parse this JSON data, do
//
//     final interestModel = interestModelFromJson(jsonString);

import 'dart:convert';

InterestModel interestModelFromJson(String str) =>
    InterestModel.fromJson(json.decode(str));

String interestModelToJson(InterestModel data) => json.encode(data.toJson());

class InterestModel {
  InterestModel({
    this.statusCode,
    this.data,
  });

  int statusCode;
  List<InterestDetails> data;

  factory InterestModel.fromJson(Map<String, dynamic> json) => InterestModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        data: json["data"] == null
            ? null
            : List<InterestDetails>.from(
                json["data"].map((x) => InterestDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class InterestDetails {
  InterestDetails({
    this.id,
    this.interest,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String interest;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory InterestDetails.fromJson(Map<String, dynamic> json) =>
      InterestDetails(
        id: json["_id"] == null ? null : json["_id"],
        interest: json["interest"] == null ? null : json["interest"],
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
        "interest": interest == null ? null : interest,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
