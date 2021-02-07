import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/widgets/colours.dart';

import 'app/routes/app_pages.dart';

LoginModel loginModel;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  loginModel = await LoginModel.fromPrefs();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gidi ads",
      theme: ThemeData(
        primaryColor: colour_login_container,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
