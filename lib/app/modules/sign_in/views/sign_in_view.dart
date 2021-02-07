import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/exit_dialog.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class SignInView extends GetView<SignInController> {
  final _formKey = GlobalKey<FormState>();

  final focus = FocusScope.of(Get.context);
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          showExitDialog();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/login_header.png"),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text("Please Login to Continue",
                    style: TextStyle(fontFamily: "Gilroy", fontSize: 18)),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      textField(
                          name: "Email",
                          controller: emailController,
                          placeholder: "Email here",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Fill this field";
                            }

                            if (!value.toString().isEmail) {
                              return "Add a valid Email";
                            }
                          },
                          password: false),
                      textField(
                          controller: passwordController,
                          name: "Password",
                          placeholder: "Password Here",
                          password: true,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Fill this field";
                            }
                          },
                          keyboardType: TextInputType.visiblePassword),
                      Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.FORGOT_PASSWORD);
                            },
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontFamily: "Gilroy",
                                  color: Colors.black,
                                  fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  )),
              buttonWidget(
                  name: "Login",
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      controller.login(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  }),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.SIGN_UP);
                },
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      fontFamily: "Gilroy", color: Colors.black, fontSize: 13),
                ),
              )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
