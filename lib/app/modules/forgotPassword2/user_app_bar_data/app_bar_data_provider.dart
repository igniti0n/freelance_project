import 'dart:developer';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';

import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/widgets/constants.dart';

class AppBarDataProvider extends GetConnect {
  Future<int> getAvailableAds() async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    LoginModel loginModel = await LoginModel.fromPrefs();
    String url = BASEURL + AVAILABLE_ADS;

    var response = await get(url, headers: {
      "Authorization": "Bearer " + loginModel.token,
    });

    if (response.hasError) {
      String responseText = (response.statusText.isNotEmpty)
          ? response.statusText
          : Strings.SOMETHING_WRONG;
      String errorMsg = (response.body != null)
          ? response.body[kMessage] ?? responseText
          : responseText;
      throw Exception(errorMsg);
    } else {
      var res = (response.body as Map<String, dynamic>)["data"];

      log("Available ads: $res");
      return res;
    }
  }

  Future<int> getRunningAds() async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    LoginModel loginModel = await LoginModel.fromPrefs();
    String url = BASEURL + RUNNING_ADS;

    var response = await get(url, headers: {
      "Authorization": "Bearer " + loginModel.token,
    });

    if (response.hasError) {
      String responseText = (response.statusText.isNotEmpty)
          ? response.statusText
          : Strings.SOMETHING_WRONG;
      String errorMsg = (response.body != null)
          ? response.body[kMessage] ?? responseText
          : responseText;
      throw Exception(errorMsg);
    } else {
      var res = (response.body as Map<String, dynamic>)["data"];

      return res;
    }
  }

  Future<int> getCompletedAds() async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    LoginModel loginModel = await LoginModel.fromPrefs();
    String url = BASEURL + COMPLETED_ADS;

    var response = await get(url, headers: {
      "Authorization": "Bearer " + loginModel.token,
    });

    if (response.hasError) {
      String responseText = (response.statusText.isNotEmpty)
          ? response.statusText
          : Strings.SOMETHING_WRONG;
      String errorMsg = (response.body != null)
          ? response.body[kMessage] ?? responseText
          : responseText;
      throw Exception(errorMsg);
    } else {
      var res = (response.body as Map<String, dynamic>)["data"];

      // log("completed ads: $res");
      return res;
    }
  }

  Future<double> getBalance() async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    LoginModel loginModel = await LoginModel.fromPrefs();
    String url = BASEURL + BALANCE;

    var response = await get(url, headers: {
      "Authorization": "Bearer " + loginModel.token,
    });

    if (response.hasError) {
      String responseText = (response.statusText.isNotEmpty)
          ? response.statusText
          : Strings.SOMETHING_WRONG;
      String errorMsg = (response.body != null)
          ? response.body[kMessage] ?? responseText
          : responseText;
      throw Exception(errorMsg);
    } else {
      var res = (((response.body as Map<String, dynamic>)["data"]
          as Map<String, dynamic>)["balance"]);

      // log("Balance: $res");
      return res.toDouble();
    }
  }
}
