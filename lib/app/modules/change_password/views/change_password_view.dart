import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/change_password/controllers/change_password_controller.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  TextEditingController newPassword = new TextEditingController();
  TextEditingController oldPassword = new TextEditingController();
  TextEditingController repeatPassword = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                          controller: oldPassword,
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
                          controller: newPassword,
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
                          controller: repeatPassword,
                          name: "Retype New Password",
                          placeholder: "Please Enter Here",
                          password: true,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Fill Field";
                            }
                            if (value != newPassword.text) {
                              return "Password must be the same";
                            }
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      buttonWidget(
                          name: "Update",
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              controller.changePassword(
                                  oldPassword.text, repeatPassword.text);
                            }
                          })
                    ],
                  ))
            ]),
          ),
        ));
  }
}
