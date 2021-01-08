import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/my_ads/controllers/my_ads_controller.dart';
import 'package:test_project_one/app/widgets/ads_card.dart';
import 'package:test_project_one/app/widgets/header.dart';

class MyAdsView extends GetView<MyAdsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          SizedBox(height: 10),
          
          Expanded(child: ListView.builder(
            itemBuilder: (context, index) {
            return show_card(report: true);
          }))
        ],
      ),
    );
  }
}
  