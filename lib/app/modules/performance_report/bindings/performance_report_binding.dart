import 'package:get/get.dart';

import 'package:test_project_one/app/modules/performance_report/controllers/performance_report_controller.dart';

class PerformanceReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerformanceReportController>(
      () => PerformanceReportController(),
    );
  }
}
