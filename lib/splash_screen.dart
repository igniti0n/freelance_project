import 'package:get/get.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.offAllNamed((loginModel != null && !loginModel.token.isNullOrBlank)
          ? Routes.HOME
          : Routes.SIGN_IN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Lottie.asset("assets/lottie/lottie.json"),
    );
  }
}
