import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/data/models/profile.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/colours.dart';

class ProfileProvider extends GetConnect {
  Future<List<dynamic>> getProfile() async {
    final pref = await SharedPreferences.getInstance();

    String url = BASEURL + PROFILE;
    String token = pref.get("token");
    var response = await get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.hasError) {
      // Get.snackbar(
      //   "Error",
      //   response.body["message"],
      //   duration: Duration(milliseconds: 5000),
      //   backgroundColor: colour_time,
      //   colorText: Colors.white,
      // );
      return Future.error(response.statusCode);
    } else {
      var res = response.body["data"];
      // final result = ProfileModel.fromJson(res);
      //  Get.snackbar(
      //   "Successful",
      //   LoginModel().message,
      //   duration: Duration(milliseconds: 5000),
      //   backgroundColor: colour_time,
      //   colorText: Colors.white,
      // );

      return res;
    }
  }

  Future<List<dynamic>> updateProfile({
    String firstname,
    String lastname,
   String phone,
    String religion,
    String education,
    String country,
    String address,
    String facebook,
    String twitter,
    String instagram,
    String youtube,
  }) async {
    final pref = await SharedPreferences.getInstance();
    ProgressDialog pr;
    BuildContext context = Get.context;
    pr = new ProgressDialog(
      context,
      showLogs: true,
      isDismissible: false,
    );
    pr.style(
        progressWidget: Container(
          width: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        message: 'Please wait...');
    pr.show();
    Map body = {
      "firstname": firstname,
      "lastname": lastname,
      "phone": phone,
      "religion": religion,
      "level_of_education": education,
      "country": country,
      "address": address,
      "facebook": facebook,
      "twitter": twitter,
      "instagram": instagram,
      "youtube": youtube,
    };
    String url = BASEURL + PROFILE;
    String token = pref.get("token");
    var response = await put(url, body, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.hasError) {
       pr.hide();
      Get.snackbar(
        "Error",
       "Error Occured",
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      return Future.error(response.statusCode);
    } else {
      pr.hide();
      var res = response.body["data"];
      final result = ProfileModel.fromJson(res);
      Get.snackbar(
        "Successful",
        LoginModel().message,
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );

      return res;
    }
  }
}
