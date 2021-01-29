import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/data/models/register.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/alert_dialog.dart';
import 'package:test_project_one/app/widgets/colours.dart';

class RegisterProvider extends GetConnect {
  Future<RegisterModel> register({
    String firtname,
    String lastname,
    String gender,
    String phone,
    String date_of_birth,
    String religion,
    String level_of_education,
    String country,
    String address,
    String email,
    String password,
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
    String url = BASEURL + REGISTER;
    Map body = {
      "firstname": firtname,
      "lastname": lastname,
      "gender": gender,
      "date_of_birth": date_of_birth,
      "religion": religion,
      "level_of_education": level_of_education,
      "country_id": country,
      "address": address,
      "email": email,
      "password": password,
      "phone": phone,
      "facebook": facebook,
      "twitter": twitter,
      "instagram": instagram,
      "youtube": youtube
    };
    var response = await post(url, body, headers: {
      "Content-Type": "application/json",
    });
    var r = response.body;
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
      pref.setString("token", RegisterModel().token);
       pref.setString("firstname",response.body["user"]["firstname"]);
      pref.setString("lastname",response.body["user"]["lastname"]);
      pref.setString("image",response.body["user"]["image"]);
     
      String token = pref.get("token");
      print(token);

      var res = response.body;
      final result = RegisterModel.fromJson(res);
      Get.snackbar(
        "Successful",
       res["message"],
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      Future.delayed(Duration(milliseconds: 3000), () {
        show_dialog(
            context: context,
            heading: "Account Pending Approval",
            right_text: "Academy",
            widget: Text("Go to the Academy"),
            right_text_fn: () {
              Get.offAllNamed(Routes.HOME);
            });
      });
      return result;
    }
  }
}
