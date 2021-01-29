import 'package:get/get.dart';
import 'package:test_project_one/app/modules/forgotPassword2/provider/provider.dart';

class ForgotPasswordController2 extends GetxController
    with StateMixin<Map<String, dynamic>> {
  //TODO: Implement ForgotPasswordController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  changePassword({String email, String token, String newwPassword}) {
    ForgotPasswordProvider()
        .retrievePassword(email: email, token: token, newPassword: newwPassword)
        .then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error());
    });
  }
}
