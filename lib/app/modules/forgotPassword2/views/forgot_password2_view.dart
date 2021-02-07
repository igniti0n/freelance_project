import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/forgotPassword2/controllers/forgot_password2_controller.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class ForgotPasswordView2 extends GetView<ForgotPasswordController2> {
  TextEditingController resetCode = new TextEditingController();
  TextEditingController newPassword = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final data;
  ForgotPasswordController2 _controller2 = Get.put(ForgotPasswordController2());
  ForgotPasswordView2({this.data});
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailController.text = data;
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
                  controller: emailController,
                  password: false,
                  readonly: true,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill this field";
                    }
                  },
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
              buttonWidget(
                  name: "Reset",
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      _controller2.changePassword(
                          email: emailController.text,
                          token: resetCode.text,
                          newwPassword: newPassword.text);
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
