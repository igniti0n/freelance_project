// To parse this JSON data, do
//
//     final fileUploadModel = fileUploadModelFromJson(jsonString);

import 'dart:convert';

FileUploadModel fileUploadModelFromJson(String str) =>
    FileUploadModel.fromJson(json.decode(str));

String fileUploadModelToJson(FileUploadModel data) =>
    json.encode(data.toJson());

class FileUploadModel {
  FileUploadModel({
    this.statusCode,
    this.message,
    this.fileUrl,
  });

  int statusCode;
  String message;
  String fileUrl;

  factory FileUploadModel.fromJson(Map<String, dynamic> json) =>
      FileUploadModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        message: json["message"] == null ? null : json["message"],
        fileUrl: json["data"] == null ? null : json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "data": fileUrl == null ? null : fileUrl,
      };
}
