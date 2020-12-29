// Header  goes here

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/routes/app_pages.dart';

final header = AppBar(
  backgroundColor: Colors.white,
  elevation: 2,
  title: Row(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage("assets/images/pics.png"),
      ),
      SizedBox(
        width: 14,
      ),
      Text("John", style: TextStyle(fontFamily: "Gilroy"),)
    ],
  ),
  actions: [
    GestureDetector(
        onTap: () => Get.toNamed(Routes.CHAT),
        child: Image.asset("assets/images/notification.png")),
  ],
);
