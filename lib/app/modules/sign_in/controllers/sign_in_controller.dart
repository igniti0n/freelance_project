import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/modules/sign_in/provider/sign_in.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';

class SignInController extends GetxController with StateMixin<LoginModel> {
  //TODO: Implement SignInController

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

  Future<void> login({String email, String password}) async {
    try {
      LoginProvider loginProvider = LoginProvider();
      var result = await loginProvider.login(email: email, password: password);
      change(result, status: RxStatus.success());
      Get.snackbar(
        Strings.SUCCESS,
        value.message ?? Strings.SOMETHING_WRONG,
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
      Future.delayed(Duration(milliseconds: 1000), () {
        Get.offAllNamed(Routes.HOME);
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
