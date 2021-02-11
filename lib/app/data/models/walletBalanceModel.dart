// To parse this JSON data, do
//
//     final walletBalanceModel = walletBalanceModelFromJson(jsonString);

import 'dart:convert';

WalletBalanceModel walletBalanceModelFromJson(String str) =>
    WalletBalanceModel.fromJson(json.decode(str));

String walletBalanceModelToJson(WalletBalanceModel data) =>
    json.encode(data.toJson());

class WalletBalanceModel {
  WalletBalanceModel({
    this.statusCode,
    this.data,
  });

  int statusCode;
  Data data;

  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) =>
      WalletBalanceModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.credit,
    this.debit,
    this.balance,
  });

  int credit;
  int debit;
  int balance;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        credit: json["credit"] == null ? null : json["credit"],
        debit: json["debit"] == null ? null : json["debit"],
        balance: json["balance"] == null ? null : json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "credit": credit == null ? null : credit,
        "debit": debit == null ? null : debit,
        "balance": balance == null ? null : balance,
      };
}
