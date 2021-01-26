import 'package:get/get.dart';
import 'package:test_project_one/app/modules/forgotPassword2/controllers/forgot_password2_controller.dart';



class ForgotPassword2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController2>(
      () => ForgotPasswordController2(),
    );
  }
}
