import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/sign_up_media_accounts/controllers/sign_up_media_accounts_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class SignUpMediaAccountsView extends GetView<SignUpMediaAccountsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/account.png"),
            SizedBox(height: 40,),
             textField(
                signup: false,
                name: "Facebook",
                placeholder: "",
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Fill Field";
                  }
                }), textField(
                signup: false,
                name: "Twitter",
                placeholder: "",
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Fill Field";
                  }
                }), textField(
                signup: false,
                name: "Instagram",
                placeholder: "",
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Fill Field";
                  }
                }), textField(
                signup: false,
                name: "Youtube",
                placeholder: "",
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Fill Field";
                  }
                }),
                 display_button(
                name: "Next",
                function: () {
                  Get.toNamed(Routes.SIGN_UP_INTEREST);
                }),
                SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
  