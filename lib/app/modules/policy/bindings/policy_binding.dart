import 'package:get/get.dart';

import 'package:test_project_one/app/modules/policy/controllers/policy_controller.dart';

class PolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolicyController>(
      () => PolicyController(),
    );
  }
}
