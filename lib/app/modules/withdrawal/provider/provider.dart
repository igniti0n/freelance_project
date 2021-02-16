import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/bankModel.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/data/models/profileUpdateModel.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:test_project_one/main.dart';

class BankProvider extends GetConnect {
  Future<User> updateBank({Map params}) async {
    ProgressDialog pr = createProgressDialog();
    String url = BASEURL + PROFILE;
    pr.show();

    var response = await request(url, "PATCH", body: params, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + loginModel.token
    });

    pr.hide();

    if (response.hasError) {
      Get.snackbar(
        "Error",
        "Error Occured",
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      return Future.error(response.statusCode);
    } else {
      var result = response.body;
      ProfileUpdateModel profileUpdateModel =
          ProfileUpdateModel.fromJson(result);
      Get.snackbar(
        "Successful",
        result['message'] ?? "Profile updated",
        duration: Duration(milliseconds: 3000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      return profileUpdateModel.data;
    }
  }

  Future<dynamic> getbank() async {
    String url = BASEURL + BANK;
    var response = await get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + loginModel.token
    });
    if (response.hasError) {
      Get.snackbar(
        "Error",
        response.body["message"],
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      return Future.error(response.statusCode);
    } else {
      final list = <BankModel>[];
      var res = response.body["data"];

      for (var rec in res) {
        print(rec);
        var abank = new BankModel();
        abank.bankName = rec["bank_name"];
        abank.id = rec["_id"];
        list.add(abank);
      }
      return list;
    }
  }
}
