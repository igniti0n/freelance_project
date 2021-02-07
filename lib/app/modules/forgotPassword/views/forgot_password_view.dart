import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/forgotPassword/controllers/forgot_password_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  TextEditingController emailController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SvgPicture.asset("assets/svg/forgotPassword.svg"),
              SizedBox(
                height: 50,
              ),
              textField(
                  controller: emailController,
                  name: "Email",
                  placeholder: "Email Here",
                  password: false,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill this field";
                    }
                  },
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 50,
              ),
              buttonWidget(
                  name: "Reset",
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      controller.forgotPassword(email: emailController.text);
                    }
                  }),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.SIGN_IN);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontFamily: "Gilroy", color: Colors.black, fontSize: 13),
                ),
              )),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
