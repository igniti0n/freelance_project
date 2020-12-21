import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/ads_details/controllers/ads_details_controller.dart';

class AdsDetailsView extends GetView<AdsDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdsDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AdsDetailsView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  