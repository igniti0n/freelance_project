import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/modules/more/controllers/more_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';

class MoreView extends GetView<MoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () => Get.toNamed(Routes.WITHDRAWAL),
                child: Text(
                  "Setup Withdrawal Bank",
                  style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
                )),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD),
                child: Text(
                  "Change Password",
                  style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
                )),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () => Get.toNamed(Routes.PROFILE),
                child: Text(
                  "My Profile",
                  style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
                )),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () => Get.toNamed(Routes.WITHDRAWAL),
                child: Text(
                  "Resources",
                  style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
                )),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () => Get.toNamed(Routes.POLICY),
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
                )),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.clear();

                  Get.offAllNamed(Routes.SIGN_IN);
                },
                child: Text(
                  "Logout",
                  style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
                )),
            SizedBox(
              height: 15,
            ),
            Spacer(),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Delete Account",
                  style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 15,
                      color: Color(0xffFF0000)),
                )),
            Text("")
          ],
        ),
      ),
    );
  }
}
