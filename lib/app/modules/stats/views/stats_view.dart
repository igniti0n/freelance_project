import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/stats/controllers/stats_controller.dart';

class StatsView extends GetView<StatsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StatsView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  