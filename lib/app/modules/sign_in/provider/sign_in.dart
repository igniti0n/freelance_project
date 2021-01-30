import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/colours.dart';

class LoginProvider extends GetConnect {
  Future<LoginModel> login({String email, password}) async {
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
    String url = BASEURL + LOGIN;
    Map body = {"email": email, "password": password};
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
      pref.setString("token", response.body["token"]);
      pref.setString("firstname", response.body["user"]["firstname"]);
      pref.setString("lastname", response.body["user"]["lastname"]);
      pref.setString("image", response.body["user"]["image"]);
      String token = pref.get("token");
      print(token);

      var res = response.body;

      // final result = LoginModel.fromJson(res);
      LoginModel loginModel = new LoginModel(
          message: res["message"],
          statusCode: res["status_code"],
          user: res["user"],
          request: res["request"],
          token: res["token"]);

      print(loginModel.user);
      Get.snackbar(
        "Successful",
        LoginModel().message,
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      Future.delayed(Duration(milliseconds: 3000), () {
        Get.offAllNamed(Routes.HOME);
      });
      return loginModel;
    }
  }
}
