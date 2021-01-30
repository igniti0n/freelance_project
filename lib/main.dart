import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/widgets/colours.dart';

import 'app/routes/app_pages.dart';

SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("token");

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gidi ads",
      theme: ThemeData(
        primaryColor: colour_login_container,
      ),
      initialRoute: token==null?AppPages.INITIAL:Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}
