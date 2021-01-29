import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/colours.dart';

class ForgotPasswordProvider extends GetConnect {
  Future<Map<String, dynamic>> retrievePassword(
      {String email, String token, String newPassword}) async {
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

    String url = BASEURL + NEWPASSWORD;
    Map body = {"email": email, "token": token, "password": newPassword};
    var response = await post(url, body, headers: {
      "Content-Type": "application/json",
    });
    if (response.hasError) {
      pr.hide();
      Get.snackbar(
        "Error",
        response.body["message"],
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      return Future.error(response.statusCode);
    } else {
     

      var res = response.body;

      Get.snackbar(
        "Successful",
        res["message"],
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      Future.delayed(
          Duration(
            milliseconds: 3000,
          ), () {
        Get.offAllNamed(Routes.SIGN_IN);
      });
      return res;
    }
  }
}
