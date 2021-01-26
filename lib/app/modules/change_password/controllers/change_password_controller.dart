import 'package:get/get.dart';
import 'package:test_project_one/app/modules/change_password/provider/provider.dart';

class ChangePasswordController extends GetxController with StateMixin<dynamic> {
  //TODO: Implement ChangePasswordController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
  void changePassword(String oldPassword, String newPassword){
    ChangePasswordProvider().changePassword(oldPassword: oldPassword, newPassword: newPassword).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error());
    });
  }
}
