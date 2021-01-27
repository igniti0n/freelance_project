import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/forgotPassword2/controllers/forgot_password2_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class ForgotPasswordView2 extends GetView<ForgotPasswordController2> {
  TextEditingController resetCode = new TextEditingController();
  TextEditingController newPassword = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final data;
  ForgotPasswordView2({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SvgPicture.asset("assets/svg/forgotPassword1.svg"),
              SizedBox(
                height: 50,
              ),
              textField(
                  
                  name: "Email",
                  placeholder: data,
                  password: false,
                  readonly: true,
                  
                  keyboardType: TextInputType.emailAddress),
             
              textField(
                  controller: resetCode,
                  name: "Reset Code",
                  placeholder: "Enter Code",
                  password: false,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill this field";
                    }
                  },
                  keyboardType: TextInputType.emailAddress),
                  
                  textField(
                  controller: newPassword,
                  name: "New Password",
                  placeholder: "*********",
                  password: true,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill this field";
                    }
                  },
                  keyboardType: TextInputType.emailAddress),
              display_button(
                  name: "Reset",
                  function: () {
                    if (_formKey.currentState.validate()) {
                      print("hell");
                      Get.toNamed(Routes.FORGOT_PASSWORD2
                        // ForgotPasswordView2(data: emailController.text)
                        );
                    }
                  }),
              SizedBox(
                height: 80,
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
