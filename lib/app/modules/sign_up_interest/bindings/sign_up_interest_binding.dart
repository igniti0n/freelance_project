import 'package:get/get.dart';

import 'package:test_project_one/app/modules/sign_up_interest/controllers/sign_up_interest_controller.dart';

class SignUpInterestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpInterestController>(
      () => SignUpInterestController(),
    );
  }
}
