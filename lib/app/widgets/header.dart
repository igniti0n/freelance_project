// Header  goes here

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/main.dart';

// HomeController home = Get.put(HomeController());
// String firstname = login.user.firstname;
final header = AppBar(
  backgroundColor: Colors.white,
  title: Row(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage("assets/images/pic1.png"),
      ),
      SizedBox(
        width: 14,
      ),
      Text(
        loginModel.user.firstname,
        style: TextStyle(fontFamily: "Gilroy"),
      ),
    ],
  ),
  actions: [
    GestureDetector(
        onTap: () => Get.toNamed(Routes.CHAT),
        child: SvgPicture.asset("assets/svg/chat.svg")),
    SizedBox(
      width: 10,
    )
  ],
);
