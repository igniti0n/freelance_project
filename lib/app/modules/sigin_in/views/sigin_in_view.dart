import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/sigin_in/controllers/sigin_in_controller.dart';

class SiginInView extends GetView<SiginInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SiginInView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SiginInView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  