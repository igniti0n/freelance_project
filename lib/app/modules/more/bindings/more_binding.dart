import 'package:get/get.dart';

import 'package:test_project_one/app/modules/more/controllers/more_controller.dart';

class MoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoreController>(
      () => MoreController(),
    );
  }
}
