import 'dart:developer';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/country.dart';
import 'package:test_project_one/app/data/models/register.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';

class RegisterProvider extends GetConnect {
  Future<RegisterModel> register({
    String firstname,
    String lastname,
    String gender,
    String phone,
    String dateOfBirth,
    String religion,
    String levelOfEducation,
    String country,
    String countryID,
    String address,
    String email,
    String password,
    String facebook,
    String twitter,
    String instagram,
    String youtube,
  }) async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    ProgressDialog progressDialog = createProgressDialog();
    progressDialog.show();

    String url = BASEURL + REGISTER;
    Map body = {
      FIRST_NAME_PARAM: firstname,
      LAST_NAME_PARAM: lastname,
      GENDER_PARAM: gender,
      DOB_PARAM: dateOfBirth,
      RELIGION_PARAM: religion,
      LEVEL_OF_EDU_PARAM: levelOfEducation,
      COUNTRY_PARAM: country,
      ADDRESS_PARAM: address,
      EMAIL_PARAM: email,
      PASSWORD_PARAM: password,
      PHONE_PARAM: phone,
      FB_PARAM: facebook,
      TWITTER_PARAM: twitter,
      INSTA_PARAM: instagram,
      YT_PARAM: youtube,
      COUNTRY_ID_PARAM: countryID,
    };

//     {
//     "firstname": "Ifeanyi",
//     "lastname": "Ezeofor",
//     "gender": "Male",
//     "date_of_birth": "22-01-1990",
//     "religion": "Christian",
//     "level_of_education": "High School",
//     "country": "Nigeria",
//     "address": "12 Ezekiel Street",
//     "email": "n@gmail.com",
//     "password": "password",
//     "phone": "08038320672",
//     "account_name": "Ifeanyi",
//     "account_number": "Ezeofor",
//     "facebook": "daspecialman",
//     "twitter": "daspecialman",
//     "instagram": "daspecialman",
//     "youtube": "youtube",
//     "country_id": "5f1fccb25f6fdc06f430965f"
// }

    final response =
        await post(url, body, headers: {"Content-Type": "application/json"});
    progressDialog.hide();

    if (response.hasError) {
      String responseText = (response.statusText.isNotEmpty)
          ? response.statusText
          : Strings.SOMETHING_WRONG;
      String errorMsg = (response.body != null)
          ? response.body[kMessage] ?? responseText
          : responseText;
      throw Exception(errorMsg);
    } else {
      var res = response.body;
      RegisterModel registerModel = RegisterModel.fromJson(res);
      return registerModel;
    }
  }

  Future<dynamic> getCountries() async {
    String url = BASEURL + COUNTRIES;

    var response = await get(url, headers: {
      "Content-Type": "application/json",
    });

    if (response.hasError) {
      Get.snackbar(
        "Country List Error",
        response.body["message"],
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      return Future.error(response.statusCode);
    } else {
      final list = <Country>[];

      var res = response.body["data"];
      for (var rec in res) {
        // Global.countries.add(
        list.add(Country(
          id: rec["_id"],
          code2: rec["code2"],
          code3: rec["code3"],
          name: rec["name"],
          capital: rec["capital"],
          region: rec["region"],
          subregion: rec["subregion"],
          states: rec["states"],
        ));
      }
      return list;
    }
  }
}

/*

show_dialog(
            context: context,
            heading: "Account Pending Approval",
            right_text: "Academy",
            widget: Text("Go to the Academy"),
            right_text_fn: () {
              Get.offAllNamed(Routes.HOME);
            });*/
