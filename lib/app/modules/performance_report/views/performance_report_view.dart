import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/performance_report/controllers/performance_report_controller.dart';

class PerformanceReportView extends GetView<PerformanceReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PerformanceReportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PerformanceReportView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  