import 'package:get/get.dart';

import 'package:test_project_one/app/modules/sign_in/controllers/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
    );
  }
}
