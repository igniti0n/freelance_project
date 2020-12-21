import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/change_password/controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangePasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChangePasswordView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  