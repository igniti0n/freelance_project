import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/sign_in/controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignInView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SignInView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  