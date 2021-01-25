import 'package:get/get.dart';

import 'package:test_project_one/app/modules/sign_up_media_accounts/controllers/sign_up_media_accounts_controller.dart';

class SignUpMediaAccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpMediaAccountsController>(
      () => SignUpMediaAccountsController(),
    );
  }
}
