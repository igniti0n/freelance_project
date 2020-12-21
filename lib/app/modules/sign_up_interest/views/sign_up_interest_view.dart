import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/sign_up_interest/controllers/sign_up_interest_controller.dart';

class SignUpInterestView extends GetView<SignUpInterestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUpInterestView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SignUpInterestView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  