import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project_one/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/exit_dialog.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class SignInView extends GetView<SignInController> {
  final _formKey = GlobalKey<FormState>();
  SignInController _signInController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          show_exit_Dialog();
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
                          placeholder: "amazing@specialmansolution.com",
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
                          name: "Password",
                          placeholder: "************",
                          password: true,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Fill this field";
                            }
                          },
                          keyboardType: TextInputType.visiblePassword),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  )),
              display_button(name: "Login", function: (){
                 if (_formKey.currentState.validate()) {
          _signInController.login();
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
                      fontFamily: "Gilroy",
                      color: colour_login_container,
                      fontSize: 13),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
