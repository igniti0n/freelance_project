import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/my_ads/controllers/my_ads_controller.dart';

class MyAdsView extends GetView<MyAdsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyAdsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MyAdsView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  