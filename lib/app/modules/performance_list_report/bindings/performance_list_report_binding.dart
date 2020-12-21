import 'package:get/get.dart';

import 'package:test_project_one/app/modules/performance_list_report/controllers/performance_list_report_controller.dart';

class PerformanceListReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerformanceListReportController>(
      () => PerformanceListReportController(),
    );
  }
}
