import 'package:get/get.dart';
import 'package:test_project_one/app/modules/forgotPassword/provider/provider.dart';

class ForgotPasswordController extends GetxController
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
  forgotPassword({String email}) {
    ForgotPasswordRequestProvider().changePassword(email: email).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error());
    });
  }
}
