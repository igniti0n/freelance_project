import 'package:get/get.dart';
import 'package:test_project_one/app/modules/forgotPassword/controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
   
  }
}
