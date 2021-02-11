import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/modules/more/provider/more_provider.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/main.dart';

class MoreController extends GetxController with StateMixin {
  //TODO: Implement MoreController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  deleteAccount({String password}) async {
    try {
      MoreProvider moreProvider = MoreProvider();
      var result = await moreProvider.deleteAccount(password: password);
      String message = result[kMessage] ?? 'User Deleted Successfully';
      change(result, status: RxStatus.success());
      Get.snackbar(
        Strings.SUCCESS,
        message,
        duration: Duration(milliseconds: 2000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );

      final pref = await SharedPreferences.getInstance();
      pref.remove(kUserData);
      loginModel = null;

      Future.delayed(Duration(milliseconds: 1000), () {
        Get.offAllNamed(AppPages.INITIAL);
      });
    } catch (onError) {
      change(onError.message, status: RxStatus.error());
      Get.snackbar(
        Strings.ERROR,
        onError.message,
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
    }
  }
}
