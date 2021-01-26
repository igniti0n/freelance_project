import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/modules/sign_in/provider/sign_in.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/colours.dart';

class SignInController extends GetxController with StateMixin<LoginModel> {
  //TODO: Implement SignInController

  final count = 0.obs;

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
  void login({String email, String password}) {
    LoginProvider().login(email: email, password: password).then((value) {
      change(value, status: RxStatus.success());
       Get.snackbar(
        "Success",
        value.message==null?"Success":value.message,
        duration: Duration(milliseconds: 5000),
        backgroundColor: colour_time,
        colorText: Colors.white,
      );
    }, onError: (err) {
      change(null, status: RxStatus.error());
      //  Get.snackbar(
      //   "Error",
      //   value.message==null?"Error":value.message,
      //   duration: Duration(milliseconds: 5000),
      //   backgroundColor: colour_border,
      //   colorText: Colors.white,
      // );
    });
  }
}
