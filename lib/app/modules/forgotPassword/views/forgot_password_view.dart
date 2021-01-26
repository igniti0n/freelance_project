import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/forgotPassword/controllers/forgot_password_controller.dart';
import 'package:test_project_one/app/modules/forgotPassword2/views/forgot_password2_view.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
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
                  placeholder: "Email here",
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
              display_button(
                  name: "Reset",
                  function: () {
                    if (_formKey.currentState.validate()) {
                      Get.to(ForgotPasswordView2(
                        data: emailController.text,
                      ));
                    }
                  }),
              SizedBox(
                height: 80,
              ),
              Center(
                  child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.SIGN_IN);
                },
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      fontFamily: "Gilroy",
                      color: colour_login_container,
                      fontSize: 13),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
