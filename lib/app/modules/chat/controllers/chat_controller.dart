import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';

class ChatController extends GetxController {
  //TODO: Implement ChatController
  final ProgressDialog pr = createProgressDialog();

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

  showProgressBar() {
    pr.show();
  }

  hideProgressBar() {
    pr.hide();
  }

  showError({String message}) {
    Get.snackbar(
      Strings.ERROR,
      message,
      duration: Duration(milliseconds: 5000),
      backgroundColor: colour_time,
      colorText: Colors.white,
    );
  }
}
