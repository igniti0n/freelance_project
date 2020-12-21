import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:test_project_one/app/modules/performance_list_report/controllers/performance_list_report_controller.dart';

class PerformanceListReportView extends GetView<PerformanceListReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PerformanceListReportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PerformanceListReportView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  