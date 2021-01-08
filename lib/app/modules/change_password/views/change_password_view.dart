import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/change_password/controllers/change_password_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Change Password",
              style: TextStyle(
                fontFamily: "Gilroy-Light",
                fontSize: 22,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  textField(
                      signup: true,
                      name: "Current Password",
                      placeholder: "Please Enter Here",
                      password: true,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Fill Field";
                        }
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  textField(
                      signup: true,
                      name: "New Password",
                      placeholder: "Please Enter Here",
                       password: true,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Fill Field";
                        }
                      }),
                       SizedBox(
                    height: 10,
                  ),
                  textField(
                      signup: true,
                      name: "Retype New Password",
                      placeholder: "Please Enter Here",
                       password: true,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Fill Field";
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  display_button(
                      name: "Update",
                      function: () {
                        Get.toNamed(Routes.PERFORMANCE_LIST_REPORT);
                      })
                ],
              ))
        ]));
  }
}
