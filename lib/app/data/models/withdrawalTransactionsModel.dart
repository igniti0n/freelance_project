// To parse this JSON data, do
//
//     final withdrawalTransactionsModel = withdrawalTransactionsModelFromJson(jsonString);

import 'dart:convert';

WithdrawalTransactionsModel withdrawalTransactionsModelFromJson(String str) =>
    WithdrawalTransactionsModel.fromJson(json.decode(str));

String withdrawalTransactionsModelToJson(WithdrawalTransactionsModel data) =>
    json.encode(data.toJson());

class WithdrawalTransactionsModel {
  WithdrawalTransactionsModel({
    this.statusCode,
    this.data,
  });

  int statusCode;
  List<TransactionDetailsModel> data;

  factory WithdrawalTransactionsModel.fromJson(Map<String, dynamic> json) =>
      WithdrawalTransactionsModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        data: json["data"] == null
            ? null
            : List<TransactionDetailsModel>.from(
                json["data"].map((x) => TransactionDetailsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TransactionDetailsModel {
  TransactionDetailsModel({
    this.id,
    this.transactionType,
    this.userId,
    this.amount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String transactionType;
  String userId;
  double amount;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory TransactionDetailsModel.fromJson(Map<String, dynamic> json) =>
      TransactionDetailsModel(
        id: json["_id"] == null ? null : json["_id"],
        transactionType:
            json["transaction_type"] == null ? null : json["transaction_type"],
        userId: json["user_id"] == null ? null : json["user_id"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
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
        "transaction_type": transactionType == null ? null : transactionType,
        "user_id": userId == null ? null : userId,
        "amount": amount == null ? null : amount,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
