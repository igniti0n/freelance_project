import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/more/provider/more_provider.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';

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
      change(result, status: RxStatus.success());
      Get.snackbar(
        Strings.SUCCESS,
        value.message ?? Strings.SOMETHING_WRONG,
        duration: Duration(milliseconds: 2000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
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
