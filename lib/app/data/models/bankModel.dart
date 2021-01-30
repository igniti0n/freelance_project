// To parse this JSON data, do
//
//     final bankModel = bankModelFromJson(jsonString);

// import 'dart:convert';

// BankModel bankModelFromJson(String str) => BankModel.fromJson(json.decode(str));

// String bankModelToJson(BankModel data) => json.encode(data.toJson());

class BankModel {
    BankModel({
        this.id,
        this.bankName,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    String bankName;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    // factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
    //     id: json["_id"],
    //     bankName: json["bank_name"],
    //     createdAt: DateTime.parse(json["createdAt"]),
    //     updatedAt: DateTime.parse(json["updatedAt"]),
    //     v: json["__v"],
    // );

    // Map<String, dynamic> toJson() => {
    //     "_id": id,
    //     "bank_name": bankName,
    //     "createdAt": createdAt.toIso8601String(),
    //     "updatedAt": updatedAt.toIso8601String(),
    //     "__v": v,
    // };
}
