import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/withdrawal/controllers/withdrawal_controller.dart';

class WithdrawalView extends GetView<WithdrawalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WithdrawalView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WithdrawalView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  