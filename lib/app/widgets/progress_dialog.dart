import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog createProgressDialog(
    {String message = 'Please wait...', double width = 50}) {
  ProgressDialog pr;
  BuildContext context = Get.context;
  pr = new ProgressDialog(
    context,
    showLogs: true,
    isDismissible: false,
  );
  pr.style(
      progressWidget: Container(
        width: width,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      message: message);
  return pr;
}

class Loader extends StatelessWidget {
  const Loader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
