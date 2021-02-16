// Header  goes here

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/main.dart';

// HomeController home = Get.put(HomeController());
// String firstname = login.user.firstname;
var imageUrl = (loginModel.user.image ?? "").obs;
final header = AppBar(
  backgroundColor: Colors.white,
  title: Row(
    children: [
      Obx(() {
        return CachedNetworkImage(
          imageUrl: imageUrl.value,
          imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundImage: imageProvider, backgroundColor: Colors.white),
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );
      }),
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
