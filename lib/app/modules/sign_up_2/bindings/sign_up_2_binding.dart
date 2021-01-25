import 'package:get/get.dart';

import 'package:test_project_one/app/modules/sign_up_2/controllers/sign_up_2_controller.dart';

class SignUp2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUp2Controller>(
      () => SignUp2Controller(),
    );
  }
}
